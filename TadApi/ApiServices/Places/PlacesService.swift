//
//  PlacesService.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 20/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Service call for Places API
/// The places service can be used to retrieve the list of supported places. The ids for the places are then used in the other services to indicate the location to be queried.
/// - SeeAlso: [places – Retrieve List of Available Places] (https://services.timeanddate.com/api/doc/v3/srv-places.html)
public class PlacesService: BaseService {

    /**
     Public function get Places
     - NOTE:  This class needs to be initialized with the accessKey and SecretKey
     - Parameters:
        - request: PlacesRequest object
     - Returns:
        - PlacesResponse
        - Service Errors
     
     ~~~
     var placesService = PlacesService(accessKey: "[YOUR_ACCESS_KEY]", secretKey:"[YOUR_SECRET_KEY]")
     var placeRequest = PlacesRequest()
     placesService.getPLacesInfo(request:placeRequest) { (result, error) in }
     ~~~
     */
    public func getPlaces(request: PlacesRequest, completionHandler:  @escaping(_ result: PlacesResponse?, _ error: ServiceErrors?) -> Void) {

        if !keysReady() {
            return completionHandler(nil, .initError("Access Key and Secret Key required!"))
        }

        networkManager.get(accesskey: self.accessKey, secretKey: self.secretKey, request: request) { (_ result: PlacesResponse?, _ error: String?) in
            if error != nil {
                completionHandler(nil, .serviceError(error!))
                return
            }

            if result?.errors != nil {
                completionHandler(nil, .serviceError(ResponseHelper().errorsToString(errors: (result?.errors)!)))
                return
            }

            if let placesResponse = result {
                completionHandler(placesResponse, nil)
            }
        }

    }

}
