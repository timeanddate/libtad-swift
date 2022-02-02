//
//  AccountService.swift
//  libtad iOS
//
//  Created by Zoltan Tuskes on 02/02/2022.
//  Copyright © 2022 Time and Date. All rights reserved.
//

import Foundation

/// Fetch package expirations and remaining credits
/// SeeAlso: [Account Service] (https://dev.timeanddate.com/docs/account-service/)
public class AccountService: BaseService {
        
    public func getAccount(request: AccountRequest, completionHandler:  @escaping(_ result: AccountResponse?, _ error: ServiceErrors?) -> Void) {
        if !keysReady() {
            return completionHandler(nil, .initError("Access Key and Secret Key required!"))
        }
        
        networkManager.get(accesskey: self.accessKey, secretKey: self.secretKey, request: request) { (_ result: AccountResponse?, _ error: String?) in
            if error != nil {
                completionHandler(nil, .serviceError(error!))
                return
            }

            if result?.errors != nil {
                completionHandler(nil, .serviceError(ResponseHelper().errorsToString(errors: (result?.errors)!)))
                return
            }

            if let accountResponse = result {
                completionHandler(accountResponse, nil)
            }
        }
    }
    
}
