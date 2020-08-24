//
//  BaseService.swift
//  TadApi iOS
//
//  Created by Zoltan Tuskes on 05/08/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

public class BaseService {

    public var accessKey: String?
    public var secretKey: String?
    let networkManager = NetworkManager()

    ///Astronomy Service initialization
    /// - Parameters:
    ///    - acesskey: [API Access Control] (https://services.timeanddate.com/api/doc/v3/chap-access.html)
    ///    - secretKey: [API Access Control] (https://services.timeanddate.com/api/doc/v3/chap-access.html)
    public init(accessKey: String!, secretKey: String!) {
        self.accessKey = accessKey
        self.secretKey = secretKey
    }

    func keysReady() -> Bool {
        if self.accessKey.isNilOrEmpty || self.secretKey.isNilOrEmpty {
            return false
        }
        return true
    }
}
