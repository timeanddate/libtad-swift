//
//  NetworkManager.swift
//  Timeanddate Service
//
//  Created by Zoltan Tuskes on 01/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

enum NetworkResponse: String {
    case success
    case accessKeyRequired = "Access Key Required!"
    case secretKeyRequired = "Secret Key Required!"
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager {
    static let environment: NetworkEnvironment = .production
    let router = Router<TadApi>()

    func get<T: Decodable>(accesskey: String!, secretKey: String!, request: RequestObject, completion: @escaping (_ result: T?, _ error: String?) -> Void) {
        router.request(TadApi.init(accesskey: accesskey, secretkey: secretKey, request: request)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }

        }
    }

    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
