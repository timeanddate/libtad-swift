//
//  HolidaysService.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 20/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Service call fo Holiday API
/// The holidays service can be used to retrieve the list of holidays for a country.
/// - Note:Some countries (e.g. China and Russia) occasionally declare working days as non-working days to form longer periods of consecutive non-working days. In exchange, weekend days become normal working days. Those days are indicated with the holiday type weekend. Please see also the discussion of the holiday types.
/// - Note:At least request version 2 shall be used for the holiday service. Request version 1 contains a problem for holidays with time stamps (affects e.g. time zone events and seasons): data has no time zone information attached but is output with inconsistent time zone.
/// - SeeAlso: [holidays – Retrieve List of Holidays] (https://dev.timeanddate.com/docs/holidays/holidays-service)
public class HolidaysService: BaseService {

    /**
     Public function get Holidaya
     - NOTE:  This class needs to be initialized with the accessKey and SecretKey
     - Parameters:
        - request: HolidaysRequest  object
     - Returns:
        - HolidaysResponse
        - Service Errors
     
     ~~~
     var holidaysService = HolidaysService(accessKey: "[YOUR_ACCESS_KEY]", secretKey:"[YOUR_SECRET_KEY]")
     holidayRequest = HolidaysRequest()
     holidayRequest.country = "no"
     holidayRequest.year = 2020
     dstListService.getHolidaysInfo(request:holidayRequest) { (result, error) in }
     ~~~
     */
    public func getHolidays(request: HolidaysRequest, completionHandler:  @escaping(_ result: HolidaysResponse?, _ error: ServiceErrors?) -> Void) {

        if !keysReady() {
            return completionHandler(nil, .initError("Access Key and Secret Key required!"))
        }

        if request.country == nil {
            return completionHandler(nil, .serviceError("Country required!"))
        }

        if request.year == nil {
            return completionHandler(nil, .serviceError("Year required!"))
        }

        networkManager.get(accesskey: self.accessKey, secretKey: self.secretKey, request: request) { (_ result: HolidaysResponse?, _ error: String?) in
            if error != nil {
                completionHandler(nil, .serviceError(error!))
                return
            }

            if result?.errors != nil {
                completionHandler(nil, .serviceError(ResponseHelper().errorsToString(errors: (result?.errors)!)))
                return
            }

            if let holidaysResponse = result {
                completionHandler(holidaysResponse, nil)
            }
        }

    }

}
