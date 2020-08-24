//
//  EndPointType.swift
//  Timeanddate Service
//
//  Created by Zoltan Tuskes on 01/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

public enum HTTPTask {
    case request

    case requestParameters(accessKey: String,
        secretKey: String,
        urlParameters: Parameters?,
        encoding: ParameterEncoding)
}
