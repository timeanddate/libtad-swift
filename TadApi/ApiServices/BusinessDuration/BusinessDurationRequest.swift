//
//  BusinessDurationRequest.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 11/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// businessduration – Calculate business days in a specified date range
/// The businessduration service can be used to calculate the number of business days between a specified start date and end date.
/// When you query the businessduration service with a placeid or a country, a start date and an end date the service will return the number of business days in that date range by excluding public holidays and weekends. Furthermore, you can apply additional filters such as individual days and whether or not the calculation should include the filter result or exclude it.
///
///~~~
///     businessDurationRequest = BusinessDurationRequest()
///     businessDurationRequest.placeId = "norway/Oslo"
///     businessDurationRequest.country = "no"
///~~~
public class BusinessDurationRequest: RequestObject {

    /// Specify the ID of the location you would like to calculate the business duration. The ID is used to find what holidays are applicable for the given place so the calculation can exclude or include those results.
    /// - Precondition: either the placeid or the country parameter has to be specified.
    ///
    /// - Note: It is also possible to specify coordinates or IATA/ICAO codes for airports, see the documentation for the type Location Id for detailed information.
    public var placeId: String!

    /// Specify the country for which you would like to calculate the business date.
    /// - Precondition: either the placeid or the country parameter have to be specified.
    public var country: String!

    /// Specify the state in the given country you want to calculate the business date.
    /// - Precondition: only if the country parameter has been specified.
    public var state: String?

    /// Specify the ISO 8601 date for the date you want to calculate to.
    public var startDt: Date!

    /// Specify the ISO 8601 date for the date you want to calculate to.
    ///
    ///     1 Type: String/ISO8601 Date
    public var endDt: Date!

    /// Specify whether the result should be calculated by including instead of excluding the days specified by filter.
    public var include: Bool = false

    /// Choose a set of types or days you want to filter on.
    /// - SeeAlso: [Business Days Filter Type] (https://services.timeanddate.com/api/doc/v3/type-filter.html)
    public var filter: [BussinesDaysFilterType] = [.weekendholidays]

    /// Whether or not the last date (enddt) should be counted in the result.
    public var includelAStdate: Bool = false

    /**
     The preferred language for the texts. An error will be raised if the language code cannot be recognized. In case the text for a specific event cannot be retrieved in the requested language it will be returned in English instead. This is also the default language.
     - NOTE:In case you have specific needs for a certain language/translation, please email api@timeanddate.com.
     - NOTE:Due to technical limitations, time zone names cannot be translated at the moment.
     - Type: String/[IISO639 Language Code ](https://services.timeanddate.com/api/doc/current/type-isolang.html)
     - This parameter is Optional!
     */
    public var lang: String = Constants.DefaultLanguage

    /// Adds verbose time specification to all ISO 8601 time stamps.
    ///     - Type: Boolean
    ///     - Accepted values: `true` or `false`
    ///     - Default value: `true`
    public var verbosetime: Bool = true

}
