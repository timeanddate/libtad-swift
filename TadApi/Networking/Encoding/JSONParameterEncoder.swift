//
//  JSONParameterEncoder.swift
//  Timeanddate Service
//
//  Created by Zoltan Tuskes on 01/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

public struct JSONParameterEncoder: ParameterEncoder {
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
