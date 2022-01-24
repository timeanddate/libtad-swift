//
//  BussinesDaysFilterType.swift
//  TadApi iOS
//
//  Created by Zoltan Tuskes on 20/07/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Business Days Filter Type
/// - SeeAlso: [Business Days Filter Type](https://services.timeanddate.com/api/doc/v3/type-filter.html)
public enum BusinessDaysFilterType: String, CaseIterable {

    /// Include or exclude Mondays.
    case mon = "mon"

    /// Include or exclude Tuesdays.
    case tue = "tue"

    /// Include or exclude Wednesdays.
    case wed = "wed"

    /// Include or exclude Thursdays.
    case thu = "thu"

    /// Include or exclude Fridays.
    case fri = "fri"

    /// Include or exclude Saturdays.
    case sat = "sat"

    /// Include or exclude Sundays.
    case sun = "sun"

    /// Include everything (only supported if include parameter is set to 1).
    case all = "all"

    /// Include or exclude weekends.
    case weekend = "weekend"

    /// Include or exclude holidays.
    case holidays = "holidays"

    /// Include or exclude weekends and holidays combined.
    case weekendholidays = "weekendholidays"

    /// Include or exclude nothing.
    case none = "none"
}
