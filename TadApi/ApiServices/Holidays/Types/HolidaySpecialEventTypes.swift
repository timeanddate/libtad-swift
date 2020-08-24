//
//  HilidaySpecialEventTypes.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 20/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Available Holiday Types and Descriptions
/// More info: [Available Holiday Types and Descriptions] (https://services.timeanddate.com/api/doc/v3/type-holidaytype.html)
///
/// Special Events
public enum HolidaySpecialEventTypes: String {

    /// Seasons (equinoxes and solstices).
    case seasons = "seasons"

    /// Sport events.
    case sport = "sport"

    /// Time zone events – daylight savings time start and end.
    case tz = "tz"

}
