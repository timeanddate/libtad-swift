//
//  DSTListService.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 19/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

///Service class for  DST List  APi Calls
/// The dstlist service can be used to obtain data about time zones for all supported countries in our database. This includes the start and end date of daylight savings time, and UTC offset for the time zones.
///
/// The resulting data is aggregated on country and time zone level. By default, only information from countries which actually observe DST is returned without listing the individually affected locations – see the parameters listplaces and onlydst to change this behavior.
/// - SeeAlso: [DSTListService] (https://services.timeanddate.com/api/doc/v3/srv-dstlist.html)
public class DSTListService: BaseService {

    /**
     Public function DST List
     - NOTE:  This class needs to be initialized with the accessKey and SecretKey
     - Parameters:
        - request: DSTListRequest object
     - Returns:
        - DSTListResponse
        - Service Errors
     
     ~~~
     var dstListService = DSTListService(accessKey: "[YOUR_ACCESS_KEY]", secretKey:"[YOUR_SECRET_KEY]")
     var dstListRequest = DSTListRequest()
     dstListRequest.year = 2020
     dstListService.getDSTListInfo(request:dstListRequest) { (result, error) in }
     ~~~
     */
    public func getDSTList(request: DSTListRequest, completionHandler:  @escaping(_ result: DSTListResponse?, _ error: ServiceErrors?) -> Void) {

        if !keysReady() {
            return completionHandler(nil, .initError("Access Key and Secret Key required!"))
        }

        networkManager.get(accesskey: self.accessKey, secretKey: self.secretKey, request: request) { (_ result: DSTListResponse?, _ error: String?) in
            if error != nil {
                completionHandler(nil, .serviceError(error!))
                return
            }

            if result?.errors != nil {
                completionHandler(nil, .serviceError(ResponseHelper().errorsToString(errors: (result?.errors)!)))
                return
            }

            if let dstListResponse = result {
                completionHandler(dstListResponse, nil)
            }
        }

    }

}
