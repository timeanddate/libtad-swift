//
//  BusinessDateService.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 07/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Service class for Astronomy APi Calls
///
/// - SeeAlso: [Business Date Service] (https://services.timeanddate.com/api/doc/v3/srv-businessdate.html)
///
public class BusinessDateService: BaseService {

    /**
     Public function get Business Date data
     - NOTE:  This class needs to be initialized with the accessKey and SecretKey
     - Parameters:
        - request: BusinessDateRequest object
     - Returns:
        - BusinessDateResponse
        - Service Errors
     
     ~~~
     var businessDateService = BusinessDateService(accessKey: "[YOUR_ACCESS_KEY]", secretKey:"[YOUR_SECRET_KEY]")
     var businessDateRequest = BusinessDateRequest()
     businessDateRequest.placeId = "norway/Oslo"
     businessDateRequest.country = "no"
     businessDateService.getBusinessDateInfo(request:businessDateRequest) { (result, error) in }
     ~~~
     */
    public func calculateBusinessDate(request: BusinessDateRequest, completionHandler:  @escaping(_ result: BusinessDateResponse?, _ error: ServiceErrors?) -> Void) {

        if !keysReady() {
            return completionHandler(nil, .initError("Access Key and Secret Key required!"))
        }

        if request.placeId == nil {
            return completionHandler(nil, .serviceError("Place ID required!"))
        }

        if request.startDt == nil {
            return completionHandler(nil, .serviceError("Start Date required!"))
        }

        if request.days == 0 {
            return completionHandler(nil, .serviceError("Days required!"))
        }

        networkManager.get(accesskey: self.accessKey, secretKey: self.secretKey, request: request) { (_ result: BusinessDateResponse?, _ error: String?) in
            if error != nil {
                completionHandler(nil, .serviceError(error!))
                return
            }

            if result?.errors != nil {
                completionHandler(nil, .serviceError(ResponseHelper().errorsToString(errors: (result?.errors)!)))
                return
            }

            if let bussinessDateResponse = result {
                completionHandler(bussinessDateResponse, nil)
            }
        }

    }

}
