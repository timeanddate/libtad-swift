//
//  ServiceErrors.swift
//  Timeanddate Service
//
//  Created by Zoltan Tuskes on 15/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// API Service eErors
public enum ServiceErrors: Error {

    /// Initialization error
    case initError(String)

    /// JSON Parsing Error
    case errorParsingJSON(String)

    /// Data Error
    case dataReturnedNil(String)

    /// Returned Data Error
    case returnedError(Error)

    /// Invalid Status Code
    case invalidStatusCode(Int)

    /// TAD Api Service Errors
    case serviceError(String)
}
