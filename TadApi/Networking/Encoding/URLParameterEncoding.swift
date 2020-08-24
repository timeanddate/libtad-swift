//
//  URLParameterEncoding.swift
//  Timeanddate Service
//
//  Created by Zoltan Tuskes on 01/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

public struct URLParameterEncoder: ParameterEncoder {
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {

        guard let url = urlRequest.url else { throw NetworkError.missingURL }

        if var urlComponents = URLComponents(url: url,
                                             resolvingAgainstBaseURL: false), !parameters.isEmpty {

            urlComponents.queryItems = [URLQueryItem]()

            var cs = CharacterSet.urlQueryAllowed
            cs.remove(charactersIn: "+/=:")

            urlComponents.percentEncodedQuery = parameters.map {
                "\($0)" + "=" + "\($1)".addingPercentEncoding(withAllowedCharacters: cs)!
            }.joined(separator: "&")

            urlRequest.url = urlComponents.url
        }

        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }

    }
}
