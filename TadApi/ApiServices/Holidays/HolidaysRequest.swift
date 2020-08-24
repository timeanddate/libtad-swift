//
//  HolidaysRequest.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 19/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// HolidaysRequest
/// - SeeAlso: [holidays – Retrieve List of Holidays] (https://services.timeanddate.com/api/doc/v3/srv-holidays.html)
///
///~~~
///     holidayRequest = HolidaysRequest()
///     holidayRequest.country = "no"
///     holidayRequest.year = 2020
///~~~
public class HolidaysRequest: RequestObject {

    /// Specify the country for which you would like to retrieve the list of holidays. A states ISO code can also be used when applicable (see a countrys state support on Holidays by Country)
    ///     - The additional code fun can be used to retrieve fun holidays.
    ///     - The additional code _all_ can be used to retrieve holidays for all countries. When you use _all_ the cost of the request will be the number of countries returned, instead of 1.
    public var country: String!

    /// The year for which the holidays should be retrieved.
    public var year: Int!

    /// The preferred language(s) for the texts. An error will be raised if the language code cannot be recognized. In case the text for a specific event cannot be retrieved in any of the requested languages it will be returned in English instead. To query for multiple languages, specify them as comma separated list or repeat the parameter multiple times. In case a requested translation is not available, it will be omitted from the output.
    ///
    /// It is possible to query all available languages in a single request by specifying a primary text language, followed by the special value _all_. This value can not be specified as the first language.
    ///     - In case you have specific needs for a certain language/translation, please email api@timeanddate.com.
    public var lang: String = Constants.DefaultLanguage

    /// Holiday types which should be returned. To combine multiple types, either separate them with commas or repeat the parameter with a different value. A negation can be expressed by prefixing the value with a tilde (~) character. Values are combined in the order they are supplied.
    ///
    /// When the country parameter is a states ISO code then this parameter must include countrydefault to get valid result since the default value does not include local/state holidays
    public var includeTypes: [HolidayTypes]?
    public var excludeTypes: [HolidayTypes]?

    /// Add time zone information under the date object.
    public var tz: Bool = true

    /// AAdds verbose time specification to all ISO 8601 time stamps.
    public var verbosetime: Bool = false

}
