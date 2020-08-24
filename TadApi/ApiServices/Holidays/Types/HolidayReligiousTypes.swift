//
//  HolidayReligiousTypes.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 19/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Available Holiday Types and Descriptions
/// More info: [Available Holiday Types and Descriptions] (https://services.timeanddate.com/api/doc/v3/type-holidaytype.html)
public enum HolidayReligiousTypes: String {

    /// Combinations of all known types (except fun.
    case all = "religious"

    /// Buddhist holidays.
    case buddhism = "buddhism"

    /// Christian holidays.
    case christian = "christian"

    /// Hebrew holidays.
    case hebrew = "hebrew"

    /// Hindu holidays.
    case hinduism = "hinduism"

    /// Muslim holidays.
    case muslim = "muslim"

    /// Orthodox holidays.
    case orthodox = "orthodox"

    /// Religious holidays, not covered by other types.
    case otherreligion = "otherreligion"
}
