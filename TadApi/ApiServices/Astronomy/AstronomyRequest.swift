//
//  AstronomyRequestParameters.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 27/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// This is the request parameters for handling Astronomy Service API request

/// For more information, see [astronomy – Get Information About Astronomical Objects](https://dev.timeanddate.com/docs/astro/)
/// ````
///     var astronomyRequest = AstronomyReques()
///     astronomyRequest.objects = "sun"
///     astronomyRequest.placeId = "norway/oslo"
/// ````

public class AstronomyRequest: RequestObject {

    /**
     Specify which astronomical object you are interested in. Currently, only sun and moon are supported.
     - Type: String/[Astronomical Object Id .](https://dev.timeanddate.com/docs/type-astroobjectid)
     - This parameter required!
     */
    public var objects: [AstroObjectType]!

    /**
     Specify the ID of the location you would like to retrieve information for. To retrieve the information for multiple places, the corresponding IDs can either be specified as a comma separated list, or by supplying the parameter multiple times (or any combination). There is a limit of maximum 10 locations per requests.
     - Note: It is also possible to specify coordinates or IATA/ICAO codes for airports, see the documentation for the type Location Id for detailed information.
     - Type: String/[Location Id ](https://dev.timeanddate.com/docs/type-locationid)
     - This parameter required!
     */
    public var placeId: String!

    /**
     Specify the ISO 8601 date for the first date you are interested in.
     - Type: String/[ISO8601 Date ](https://dev.timeanddate.com/docs/type-iso#isoDate)
     - This parameter required!
     */
    public var startDate: Date!

    /**
     The last date you are interested in. The service can be used to calculate data for a maximum of 31 days in a row. If the end date is omitted, only one day is retrieved.
     - Type: String/[ISO8601 Date ](https://dev.timeanddate.com/docs/type-iso#isoDate)
     - This parameter Optional!
     */
    public var endDate: Date?

    /**
     Selection of which astronomical events you are interested in. To combine multiple classes, either separate them with commas or repeat the parameter with a different value. A negation can be expressed by prefixing the value with a tilde (~) character. Values are combined in the order they are supplied.
     - Type: String/[IAstronomy Event Class ](https://dev.timeanddate.com/docs/type-astroeventclass)
     - This parameter Optional!
     */
    public var types: [EventClass] = []

    /**
     Return longitude and latitude for the geo object.
     - This parameter Optional!
     */
    public var geo: Bool = true

    /**
     Adds time stamps (local time) in ISO 8601 format to all events.
     - This parameter Optional!
     */
    public var isoTime: Bool = false

    /**
     The preferred language for the texts. An error will be raised if the language code cannot be recognized. In case the text for a specific event cannot be retrieved in the requested language it will be returned in English instead. This is also the default language.
     - NOTE:In case you have specific needs for a certain language/translation, please email api@timeanddate.com.
     - NOTE:Due to technical limitations, time zone names cannot be translated at the moment.
     - Type: String/[IISO639 Language Code ](https://dev.timeanddate.com/docs/type-iso#isoLang)
     - Default value: en
     - This parameter Optional!
     */
    public var lang: String = Constants.DefaultLanguage

    /**
     Search radius for translating coordinates (parameter placeid) to locations. Coordinates that could not be translated will yield results for the actual geographical position – if you would like to query for times at an exact location, specify a radius of zero (0).
     - Type: Integer
     - Default value: infinite (but only locations within the same country and time zone are considered)
     - This parameter Optional!
     */
    public var radius: Int = 0

    /**
     Adds UTC time stamps in ISO 8601 format to all events.
     - This parameter Optional!
     */
    public var utcTime: Bool = false

}
