//
//  BusinessDurationService.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 11/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Service class for Busimess Duration Api calls
/// - SeeAlso: [Business Duration Service] (https://services.timeanddate.com/api/doc/v3/srv-businessduration.html)
public class BusinessDurationService: BaseService {

    /**
     Public function get Business Duration data
     - NOTE:  This class needs to be initialized with the accessKey and SecretKey
     - Parameters:
        - request: BusinessDurationRequest object
     - Returns:
        - BusinessDurationResponse
        - Service Errors
     
     ~~~
     var businessDurationService = BusinessDurationService(accessKey: "[YOUR_ACCESS_KEY]", secretKey:"[YOUR_SECRET_KEY]")
     businessDurationRequest = BusinessDurationRequest()
     businessDurationRequest.placeId = "norway/Oslo"
     businessDurationRequest.country = "no"
     businessDurationService.getBusinessDurationInfo(request:businessDurationRequest) { (result, error) in }
     ~~~
     */
    public func getBusinessDurationInfo(request: BusinessDurationRequest, completionHandler:  @escaping(_ result: BusinessDurationResponse?, _ error: ServiceErrors?) -> Void) {

        if !keysReady() {
            return completionHandler(nil, .initError("Access Key and Secret Key required!"))
        }

        if request.placeId == nil {
            return completionHandler(nil, .serviceError("Place ID required!"))
        }

        if request.startDt == nil {
            return completionHandler(nil, .serviceError("Start Date required!"))
        }

        if request.endDt == nil {
            return completionHandler(nil, .serviceError("End Date required!"))
        }

        networkManager.get(accesskey: self.accessKey, secretKey: self.secretKey, request: request) { (_ result: BusinessDurationResponse?, _ error: String?) in
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
