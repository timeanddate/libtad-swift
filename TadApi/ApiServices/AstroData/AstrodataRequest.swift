//
//  AstrodataRequest.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 28/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// This is the request parameters for handling Astrodata Service API request
/**
 For more information, see [astrodata – Calculate data on Astronomical Objects on Specific Times](http://services.timeanddate.com/api/doc/v3/srv-astrodata.html)
 ````
 var astrodatRequest = AstrodataRequest()
 astrodatRequest.objects = "sun"
 astrodatRequest.placeId = "norway/oslo"
 astrodatRequest.interval = "2020-06-02T11:09:49"
 ````
 */
public class AstrodataRequest: RequestObject {

    /**
     Specify which astronomical object you are interested in. To retrieve the information for multiple objects, the corresponding names can either be specified as a comma separated list, or by supplying the parameter multiple times (or any combination). Currently, only sun and moon are supported as objects.
     - Type: String/Astronomical Object Id
     */
    public var objects: [AstroObjectType]!
    /**
     Specify the ID of the location you would like to retrieve information for. To retrieve the information for multiple places, the corresponding IDs can either be specified as a comma separated list, or by supplying the parameter multiple times (or any combination). There is a limit of maximum 10 locations per requests.
     - NOTE: It is also possible to specify coordinates or IATA/ICAO codes for airports, see the documentation for the type Location Id for detailed information.
     */
    public var placeId: String!

    /**
     Specify the point(s) in time you would like to calculate data for. Multiple results can be retrieved by specifying several timestamps separated by comma, maximum 50.
     - Type: String/ISO8601 Timestamp
     */
    public var interval: [String]!

    ///Specify whether or not the intervals should be considered the local time for the place(s) or UTC time.
    public var localtime: Bool = false

    ///   Adds time stamps (local time) in ISO 8601 format to all events.
    public var isoTime: Bool = false

    ///   Adds UTC time stamps in ISO 8601 format to all events.
    public var utcTime: Bool = false

    ///       The preferred language for the texts. An error will be raised if the language code cannot be recognized. In case the text for a specific event cannot be retrieved in the requested language it will be returned in English instead. This is also the default language.
    ///        - NOTE:In case you have specific needs for a certain language/translation, please email api@timeanddate.com.
    ///        - NOTE:Due to technical limitations, time zone names cannot be translated at the moment.
    ///        - Type: String/[IISO639 Language Code ](https://services.timeanddate.com/api/doc/current/type-isolang.html)
    ///        - Default value: en
    ///        - This parameter Optional!

    public var lang: String = Constants.DefaultLanguage

    ///       Search radius for translating coordinates (parameter placeid) to locations. Coordinates that could not be translated will yield results for the actual geographical position – if you would like to query for times at an exact location, specify a radius of zero (0).
    ///        - Default value: infinite (but only locations within the same country and time zone are considered)
    ///        - This parameter Optional!
    public var radius: Int = 0

}
