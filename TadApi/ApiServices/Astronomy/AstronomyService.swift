//
//  AstronomyService.swift
//  Timeanddate Service
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation
/// Service class for Astronomy APi Calls
/// - SeeAlso: [Astronomy API] (https://dev.timeanddate.com/docs/astro/)
public class AstronomyService: BaseService {

    /**
     Public function get Astronomical data
     - NOTE:  This class needs to be initialized with the accessKey and SecretKey
     - Parameters:
     - request: AstronomyRequest object
     - Returns:
     - Astronomy Data Respomse: AstronomyDataResponse
     - Service Errors
     
     ~~~
     var astronomyService = AstronomyService(accessKey: "[YOUR_ACCESS_KEY]", secretKey:"[YOUR_SECRET_KEY]")
     var astronomyRequest = AstronomyRequest()
     astronomyRequest.objects = "sun"
     astronomyRequest.placeId = "norway/oslo".
     astronomyService.getAstronomicalInfo(request:astronomyRequest) { (result, error) in }
     ~~~
     */
    public func getAstronomicalInfo(request: AstronomyRequest, completionHandler:  @escaping(_ result: AstronomyDataResponse?, _ error: ServiceErrors?) -> Void) {

        if !keysReady() {
            return completionHandler(nil, .initError("Access Key and Secret Key required!"))
        }

        if request.objects == nil {
            return completionHandler(nil, .serviceError("Objects required!"))
        }

        if request.placeId == nil {
            return completionHandler(nil, .serviceError("Place ID required!"))
        }

        if request.startDate == nil {
            return completionHandler(nil, .serviceError("Start date required!"))
        }

        networkManager.get(accesskey: self.accessKey, secretKey: self.secretKey, request: request) { (_ result: AstronomyDataResponse?, _ error: String?) in

            if error != nil {
                completionHandler(nil, .serviceError(error!))
                return
            }

            if result?.errors != nil {
                completionHandler(nil, .serviceError(ResponseHelper().errorsToString(errors: (result?.errors)!)))
                return
            }

            if let astronomyResponse = result {

                print(astronomyResponse)

                completionHandler(astronomyResponse, nil)
            }

        }
    }
}
