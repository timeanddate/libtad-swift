//
//  ConvertTimeRequest.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 11/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// converttime – Convert Time Between Time Zones
/// The converttime service can be used to convert any time from UTC or any of the supported locations to any other of the supported locations.
/// You have to specify a time stamp either in ISO8601 representation via the iso parameter, or you have to specify the individual components of the time stamp. Skipped components will not yield an error message, but use a default value instead (which corresponds to 01.01.2001, 00:00:00).
/// - SeeAlso: [converttime](https://dev.timeanddate.com/docs/time/converttime)
///
///~~~
///     var convertTimeRequest =ConvertTimeRequest()
///     convertTimeRequest.fromPlaceId = "australia/lord-howe-island"
///     convertTimeRequest.toPlaceId = "mozambique/maputo"
///     convertTimeRequest.isoTimeStamp = "2020-06-08T09:18:16"
///~~~
public class ConvertTimeRequest: RequestObject {

    /// Specify the ID of the location for which the supplied time stamp corresponds. If the time stamp is in UTC, use the location id 1440 (or /utc).
    public var fromPlaceId: String!

    /// Specify the ID of the location(s) for which the time stamp should be converted. You can supply multiple locations by either providing them as comma separated list, or by repeating the parameter multiple times. There is a limit of maximum 25 locations per requests.
    public var toPlaceId: String?

    /// Year component of the time stamp.
    ///     - Condition: either the iso or the parameters for the separate field time stamp have to be specified.
    public var year: Int?

    /// Month component of the time stamp.
    ///     - Condition: either the iso or the parameters for the separate field time stamp have to be specified.
    public var month: Int?

    /// Day component of the time stamp.
    ///     - Condition: either the iso or the parameters for the separate field time stamp have to be specified.
    public var day: Int?

    /// Hour component of the time stamp.
    ///     - Condition: either the iso or the parameters for the separate field time stamp have to be specified.
    public var hour: Int?

    /// Minute component of the time stamp.
    ///     - Condition: either the iso or the parameters for the separate field time stamp have to be specified.
    public var minute: Int?

    /// Seconds component of the time stamp.
    ///     - Condition: either the iso or the parameters for the separate field time stamp have to be specified.

    public var second: Int?

    /// Time stamp in ISO8601 format.
    ///     - Example: 2011-06-08T09:18:16
    ///     - Condition: either the iso or the parameters for the separate field time stamp have to be specified.
    public var isoTimeStamp: Date?

    /// The preferred language for the texts. An error will be raised if the language code cannot be recognized. In case the text for a specific event cannot be retrieved in the requested language it will be returned in English instead. This is also the default language.
    /// - NOTE:In case you have specific needs for a certain language/translation, please email api@timeanddate.com.
    /// - NOTE:Due to technical limitations, time zone names cannot be translated at the moment.
    public var lang: String = Constants.DefaultLanguage

    ///Search radius for translating coordinates (parameter placeid) to locations. Coordinates that could not be translated will yield results for the actual geographical position – if you would like to query for times at an exact location, specify a radius of zero (0).
    ///     - Default value: infinite (but only locations within the same country and time zone are considered)
    public var radius: Int?

    /// Add a list of time changes during the year to the location object. This listing e.g. shows changes caused by daylight savings time.
    public var timeChanges: Bool = false

    /// Add time zone information under the time object.
    public var timeZoneInfo: Bool = true

    /// Adds verbose time specification to all ISO 8601 time stamps.
    public var verbosetime: Bool = true

}
