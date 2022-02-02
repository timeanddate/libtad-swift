//
//  DSTListRequest.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 13/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// DST List Request
/// - SeeAlso: [dstlist – Retrieve Daylight Saving Time Information] (https://dev.timeanddate.com/docs/time/dstlist)
///
///~~~
///     var dstListRequest =DSTListRequest()
///     dstListRequest.year = 2020
///~~~

public class DSTListRequest: RequestObject {

    /// The year you want to retrieve the information for.
    ///
    /// - Note: The service does not restrict the years for which information can be queried. However, for years before 1970, the database does not cover all countries completely (this affects e.g. Australia, Canada and the United States of America).
    public var year: Int?

    /// Specify the country for which you want to retrieve information for in as an ISO3166-1-alpha-2 country code. If unspecified, information for all countries will be returned.
    ///     - Specifying this parameter automatically sets the parameter `onlydst` to 0.
    public var country: String?

    /// Return only countries which actually observe DST in the queried year. Other countries will be suppressed.
    public var onlyDST: Bool = false

    /// The preferred language for the texts. An error will be raised if the language code cannot be recognized. In case the text for a specific event cannot be retrieved in the requested language it will be returned in English instead. This is also the default language.
    ///
    /// - NOTE:In case you have specific needs for a certain language/translation, please email api@timeanddate.com.
    /// - NOTE:Due to technical limitations, time zone names cannot be translated at the moment.
    public var lang: String = Constants.DefaultLanguage

    /// For every time zone/country, list the individual places that belong to each record.
    public var listPlaces: Bool = true

    /// Add a list of time changes during the year to the dstentry object. This listing e.g. shows changes caused by daylight savings time.
    public var timeChanges: Bool = false

    /// Adds verbose time specification to all ISO 8601 time stamps.
    /// To limit the result size, this parameter is only honored if a single country is queried – otherwise verbose time stamps are suppressed.
    public var verbosetime: Bool = false

}
