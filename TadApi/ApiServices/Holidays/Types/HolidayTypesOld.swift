//
//  HolidayTypes.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 19/05/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Available Holiday Types and Descriptions
/// More info: [Available Holiday Types and Descriptions] (https://services.timeanddate.com/api/doc/v3/type-holidaytype.html)
public enum HolidayTypesOld: String {

    /// Combinations of all known types (except fun.
    case all = "all"

    /// Default holiday set: federal, federallocal, obs1, weekday.
    case htDefault = "default"

    /// Default set depending on country.
    ///
    /// For most countries, this is the same as default. However, for some countries it makes sense to add further types – this type accounts for this case. Currently this only affects the UK: local holidays are added as well. This is to include days that are only valid in one of countries – e.g. Jan 2 is a holiday only for Scotland.
    case countrydefault = "countrydefault"

    /// Important (obs1), common (obs2) and other observances (obs3).
    case obs = "obs"

    /// All religious holidays: buddhism, christian, hebrew, hinduism, muslim, orthodox.
    case religious = "religious"

}
