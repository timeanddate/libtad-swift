//
//  BusinessDateRequest.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 06/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// businessdate – Calculate business date from a given number of days
/// The businessdate service can be used to find a business date from a specified number of days.
/// You can choose if you want to calculate the business date by adding (default) or subtracting the given days, and whether or not a specific filter should be applied to the result. By default the result will be filtered on excluding weekends and public holidays, but you can specify a custom filter to modify this.
/// - SeeAlso: [businessdate API Reference] (https://services.timeanddate.com/api/doc/v3/srv-businessdate.html)
///
/// - Example: 
/// ````
/// var businessDateRequest = BusinessDateRequest()
/// businessDateRequest.placeId = "norway/Oslo"
/// businessDateRequest.country = "no"
/// ````

public class BusinessDateRequest: RequestObject {

    /// Specify the ID of the location you would like to calculate the business date. The ID is used to find what holidays are applicable for the given place so the calculation can exclude or include those results.
    ///
    /// - Precondition: either the placeid or the country parameter has to be specified.
    ///
    /// - Note: It is also possible to specify coordinates or IATA/ICAO codes for airports, see the documentation for the type Location Id for detailed information.

    public var placeId: String!

    /// Specify the country for which you would like to calculate the business date.
    /// - Type: String/ISO3166-1-alpha-2 country code
    /// - Precondition: either the placeid or the country parameter has to be specified.
    public var country: String!

    /// Specify the state in the given country you want to calculate the business date.
    /// - Type: String/ISO3166-2 country state code
    /// - Precondition: only if the country parameter has been specified.
    public var state: String?

    /// Specify the ISO 8601 date for the first date you are interested in.
    /// - Type: String/ISO8601 Date
    public var startDt: Date!

    /// Specify how many business days to count.
    /// - Type: Integer/Array of integers
    /// - Example: 10,20
    ///
    /// - Note: The parameter will be sorted in ascending order (e.g. if the values 30,20,10 is passed it will be sorted to 10,20,30). There is a limit of maximum 10 values per requests.
    public var days: Int = 1

    /// Specify whether the result should be calculated by including instead of excluding the days.
    public var include: Bool  = false

    /// Choose a set of types or days you want to filter on.
    ///     - Default value: weekendholidays
    public var filter: [BusinessDaysFilterType] = [.weekendholidays]

    /// Set if the service should do an addition or subtraction of the specified days.
    ///     - Default value: add
    public var op: [BusinessDaysOperatorType] = []

    /// Set how many times the calculation should be repeated (only applicable when days parameter has exactly one number).
    public var repeatDays: Int = 0

    /**
     The preferred language for the texts. An error will be raised if the language code cannot be recognized. In case the text for a specific event cannot be retrieved in the requested language it will be returned in English instead. This is also the default language.
     - NOTE:In case you have specific needs for a certain language/translation, please email api@timeanddate.com.
     - NOTE:Due to technical limitations, time zone names cannot be translated at the moment.
     - Type: String/[IISO639 Language Code ](https://services.timeanddate.com/api/doc/current/type-isolang.html)
     - Default value: en
     - This parameter is optional!
     */
    public var lang: String = Constants.DefaultLanguage

    /// Adds verbose time specification to all ISO 8601 time stamps.
    public var verbosetime: Bool = true

}
