//
//  TimeRequest.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 22/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Tie Service Request
/// - SeeAlso: [timeservice – Retrieve Current Time for Place] (https://services.timeanddate.com/api/doc/v3/srv-timeservice.html)
///
///~~~
///     var timeRequest = TimeRequest()
///     timeRequest.placeId = "norway/oslo"
///~~~
public class TimeRequest: RequestObject {

    /// Specify the ID of the location you would like to get the current time from. To retrieve the time for multiple places, the corresponding IDs can either be specified as a comma separated list, or by supplying the parameter multiple times (or any combination). There is a limit of maximum 25 locations per requests.
    /// - Precondition: placeid parameter must be specified
    /// - Note:  It is also possible to specify coordinates or IATA/ICAO codes for airports, see the documentation for the type Location Id for detailed information.
    public var placeId: String!

    /// Maximum number of query results to be returned. This number may be further limited by access key specific restrictions.
    /// - Precondition: only values from 0-200 accepted
    public var qLimit: Int?

    /// Return longitude and latitude for the geo object.
    public var geo: Bool = true

    /// The preferred language for the esponses. An error will be raised if the language code cannot be recognized. In case the text for a specific event cannot be retrieved in the requested language it will be returned in English instead. This is also the default language.
    /// - Note: Due to technical limitations, time zone names cannot be translated at the moment.
    public var lang: String = Constants.DefaultLanguage

    /// Search radius for translating coordinates (parameter placeid) to locations. Coordinates that could not be translated will yield results for the actual geographical position.
    public var radius: Int?

    /// Controls if the astronomy element with information about sunrise and sunset shall be added to the result.
    public var sun: Bool = true

    /// Adds current time under the location object.
    public var time: Bool = true

    /// Add a list of time changes during the year to the location object. This listing e.g. shows changes caused by daylight savings time.
    public var timechanges: Bool = true

    /// Add time zone information under the time object.
    public var tz: Bool = true

    /// Adds verbose time specification to all ISO 8601 time stamps.
    public var verbosetime: Bool = true

}
