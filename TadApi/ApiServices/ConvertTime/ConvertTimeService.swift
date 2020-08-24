//
//  ConvertTimeService.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 13/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

///Service class for Convert Time  API Calls
/// - SeeAlso: [ConvertTimeService] (https://services.timeanddate.com/api/doc/v3/srv-converttime.html)
public class ConvertTimeService: BaseService {

    /**
     Public function Convert Time
     - NOTE:  This class needs to be initialized with the accessKey and SecretKey
     - Parameters:
        - request: ConvertTimeRequest object
     - Returns:
        - ConvertTimeResponse
        - Service Errors
     
     ~~~
     var convertTimeService = ConvertTimeService(accessKey: "[YOUR_ACCESS_KEY]", secretKey:"[YOUR_SECRET_KEY]")
     var convertTimeRequest = ConvertTimeRequest()
     convertTimeRequest.fromPlaceId = "mozambique/maputo"
     convertTimeRequest.toPlaceId = "norway/oslo"
     convertTimeRequest.isoTimeStamp = "2020-06-02T11:09:49"
     convertTimeService.getConvertTimeInfo(request:astrodatRequest) { (result, error) in }
     ~~~
     */
    public func convertTime(request: ConvertTimeRequest, completionHandler:  @escaping(_ result: ConvertTimeResponse?, _ error: ServiceErrors?) -> Void) {

        if !keysReady() {
            return completionHandler(nil, .initError("Access Key and Secret Key required!"))
        }

        if request.fromPlaceId == nil {
            return completionHandler(nil, .serviceError("Place ID required!"))
        }

        networkManager.get(accesskey: self.accessKey, secretKey: self.secretKey, request: request) { (_ result: ConvertTimeResponse?, _ error: String?) in
            if error != nil {
                completionHandler(nil, .serviceError(error!))
                return
            }

            if result?.errors != nil {
                completionHandler(nil, .serviceError(ResponseHelper().errorsToString(errors: (result?.errors)!)))
                return
            }

            if let convertTimeResponse = result {
                completionHandler(convertTimeResponse, nil)
            }
        }

    }

}
