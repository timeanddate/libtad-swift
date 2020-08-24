//
//  AstrodataService.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 28/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Service class for Astrodata APi Calls
/**
 - Service reference: [Astrodata Service] (https://services.timeanddate.com/api/doc/v3/srv-astrodata.html)
 */
public class AstrodataService: BaseService {

    /**
     Public function get Astro Data
     - NOTE: This class needs to be initialized with the accessKey and SecretKey
     - Parameters:
        - request: AstrodataRequest object
     - Returns:
        - Astro Data Respomse: ` AstroDataResponse`
        - Service Errors
     
     ~~~
     var astroDataService = AstrodataService(accessKey: "[YOUR_ACCESS_KEY]", secretKey:"[YOUR_SECRET_KEY]")
     var astrodatRequest = AstrodataRequest()
     astrodatRequest.objects = "sun"
     astrodatRequest.placeId = "norway/oslo"
     astrodatRequest.interval = "2020-06-02T11:09:49"
     astroDataService.getAstroDataInfo(request:astrodatRequest) { (result, error) in }
     ~~~
     */
    public func getAstroDataInfo(request: AstrodataRequest, completionHandler:  @escaping(_ result: AstroDataResponse?, _ error: ServiceErrors?) -> Void) {

        if !keysReady() {
            return completionHandler(nil, .initError("Access Key and Secret Key required!"))
        }

        if request.objects == nil {
            return completionHandler(nil, .serviceError("Objects required!"))
        }

        if request.placeId == nil {
            return completionHandler(nil, .serviceError("Place ID required!"))
        }

        if request.interval == nil {
            return completionHandler(nil, .serviceError("Interval Required!"))
        }

        if request.interval.count > 50 {
            return completionHandler(nil, .serviceError("Maximum 50 timestamp items allowed!"))
        }

        networkManager.get(accesskey: self.accessKey, secretKey: self.secretKey, request: request) { (_ result: AstroDataResponse?, _ error: String?) in

            if error != nil {
                completionHandler(nil, .serviceError(error!))
                return
            }

            if result?.errors != nil {
                completionHandler(nil, .serviceError(ResponseHelper().errorsToString(errors: (result?.errors)!)))
                return
            }

            if let astronomyResponse = result {
                completionHandler(astronomyResponse, nil)
            }

        }

        completionHandler(nil, nil)
    }

}
