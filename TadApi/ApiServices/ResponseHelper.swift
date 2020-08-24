//
//  ResponseHelper.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 27/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

class ResponseHelper {
    public init() {}

    public func errorsToString(errors: [String]) -> String {

        var result = ""
        for i in 0 ..< (errors.count) {
            result += "\(errors[i])\n"
        }
        return result
    }

}
