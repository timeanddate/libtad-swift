//
//  TimeService.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 25/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Service call for TimeServce API
/// The timeservice service can be used to retrieve the current time in one or more places. Additionally, information about time zones and related changes and the time of sunrise and sunset can be queried.
/// - SeeAlso: [timeservice – Retrieve Current Time for Place] (https://dev.timeanddate.com/docs/time/timeservice)
public class TimeService: BaseService {

    /**
     Public function get Time
     - NOTE:  This class needs to be initialized with the accessKey and SecretKey
     - Parameters:
        - request: TimeRequest object
     - Returns:
        - TimeResponse
        - Service Errors
     
     ~~~
     var timeService = TimeServce(accessKey: "[YOUR_ACCESS_KEY]", secretKey:"[YOUR_SECRET_KEY]")
     var timeRequest = TimeRequest()
     timeRequest.placeId = "norway/oslo"
     timeService.getPLacesInfo(request:timeRequest) { (result, error) in }
     ~~~
     */
    public func getCurrentTime(request: TimeRequest, completionHandler:  @escaping(_ result: TimeResponse?, _ error: ServiceErrors?) -> Void) {

        if self.accessKey.isNilOrEmpty || self.secretKey.isNilOrEmpty {
            return completionHandler(nil, .initError("Access Key and Secret Key required!"))
        }

        if request.placeId == nil {
            completionHandler(nil, .serviceError("Place ID required"))
        }

        networkManager.get(accesskey: self.accessKey, secretKey: self.secretKey, request: request) { (_ result: TimeResponse?, _ error: String?) in
            if error != nil {
                completionHandler(nil, .serviceError(error!))
                return
            }

            if result?.errors != nil {
                completionHandler(nil, .serviceError(ResponseHelper().errorsToString(errors: (result?.errors)!)))
                return
            }

            if let timeResponse = result {
                completionHandler(timeResponse, nil)
            }
        }

    }

}
