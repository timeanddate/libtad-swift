//
//  HolidayNationalTypes.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 20/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Available Holiday Types and Descriptions
/// More info: [Available Holiday Types and Descriptions] (https://services.timeanddate.com/api/doc/v3/type-holidaytype.html)
///
/// National/Federal holidays and observances
public enum HolidayNationalTypes: String {

    /// Some countries (e.g. Sweden) have days which are de facto treted as official holidays, even if there's no legal regulation.
    case defacto = "defacto"

    /// Federal/national holidays.
    case federal = "federal"

    /// Common local holidays.
    case federallocal = "federallocal"

    /// Flag days.
    case flagday = "flagday"

    /// Half day holidays (only afternoon off). These days can be half day holidays either by law, or being de facto half day holidays (e.g. Sweden).
    case halfday = "halfday"

    /// Local holidays.
    case local = "local"

    /// Local observances.
    case local2 = "local2"

    /// Important observances.
    case obs1 = "obs1"

    /// Common observances.
    case obs2 = "obs2"

    /// Other observances.
    case obs3 = "obs3"

    /// Optional holiday.
    ///
    /// Employment and holiday laws in certain countries allow employees to choose a limited number of holidays from a list of holidays. Some employees may choose to take the day off on these day, however, most offices and businesses remain open.
    case optional = "optional"

    /// Normal working days.
    ///
    /// In some cases, working days are declared non-working days in order to form a longer period of consecutive non-working days. In exchange, weekend days become normal working days.
    case weekday = "weekday"

    /// Seasons (equinoxes and solstices).
    case seasons = "seasons"

    /// Sport events.
    case sport = "sport"

    /// Time zone events – daylight savings time start and end.
    case tz = "tz"

    /// United Nations days.
    case un = "un"

    /// Worldwide observations.
    case world = "world"

}
