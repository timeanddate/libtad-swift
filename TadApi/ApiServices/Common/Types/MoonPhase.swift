//
//  MoonPhase.swift
//  TadApi iOS
//
//  Created by Zoltan Tuskes on 20/07/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// MoonPhase
/// - SeeAlso:  [Moon Phase Type] (https://dev.timeanddate.com/docs/type-moonphase)
public enum MoonPhase: String, CaseIterable {

    /// New moon.
    case newmoon = "newmoon"

    /// Waxing crescent moon.
    case waxingcrescent = "waxingcrescent"

    /// Moon in first quarter.
    case firstquarter = "firstquarter"

    /// Waxing gibbous moon.
    case waxinggibbous = "waxinggibbous"

    /// Full moon.
    case fullmoon = "fullmoon"

    //// Waning gibbous moon.
    case waninggibbous = "waninggibbous"

    /// Moon in third quarter.
    case thirdquarter = "thirdquarter"

    /// Waning crescent moon.
    case waningcrescent = "waningcrescent"

}
