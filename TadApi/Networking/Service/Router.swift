//
//  EndPointType.swift
//  Timeanddate Service
//
//  Created by Zoltan Tuskes on 01/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?

    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            NetworkLogger.log(request: request)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                NetworkLogger.log(response: data!)
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }

    func cancel() {
        self.task?.cancel()
    }

    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {

        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)

        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let accessKey, let secretKey, let urlParameters, let encoding):

                var urlParam = urlParameters

                let urlPath = (request.url?.path)!
                let p = urlPath.replacingOccurrences(of: "/", with: "")
                let timestamp = expireTime()
                let message = accessKey +  p + timestamp
                let signature = message.hmac(CryptoAlgorithm.sha1, key: secretKey)
                urlParam!["expires"] = timestamp
                urlParam!["signature"] = signature

                try self.configureParameters(encoding: encoding,
                                             urlParameters: urlParam,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }

    fileprivate func configureParameters(encoding: ParameterEncoding,
                                         urlParameters: Parameters?,
                                         request: inout URLRequest) throws {
        do {
            try encoding.encode(urlRequest: &request, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }

    /// Expire Time
    /// This creates an expire time that is 60seconds. If needed we can make it variable. 
    fileprivate func expireTime() -> String {
        let dateFormatter = DateFormatter()
        let currentLocale = NSLocale.current
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = currentLocale
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        return dateFormatter.string(from: Date(timeIntervalSinceNow: 60)) + "Z"
    }

}
