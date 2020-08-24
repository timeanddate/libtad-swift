//
//  AstronomyEventCodes.swift
//  TadApi iOS
//
//  Created by Zoltan Tuskes on 31/07/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Astronomy Event Codes
/// - SeeAlso: [Astronomy Event Codes](https://services.timeanddate.com/api/doc/v3/type-astroeventcode.html)
public enum AstronomyEventCodes: String, CaseIterable {
    /// Astronomical twilight (-18°) start.
    case twi18_start = "twi18_start"

    /// Nautical twilight (-12°) start.
    case twi12_start = "twi12_start"

    /// Civil twilight (-6°) start.
    case twi6_start = "twi6_start"

    /// Sun- or Moonrise.
    case rise = "rise"

    /// Meridian passing (noon).
    case meridian = "meridian"

    /// Sun- or Moonset.
    case set = "set"

    /// Civil twilight (-6°) end.
    case twi6_end = "twi6_end"

    /// Nautical twilight (-12°) end.
    case twi12_end = "twi12_end"

    /// Astronomical twilight (-18°) end.
    case twi18_end = "twi18_end"

    /// Antimeridian passing (midnight).
    case antimeridian = "antimeridian"

    /// New moon.
    case newmoon = "newmoon"

    /// Moon in first quarter.
    case firstquarter = "firstquarter"

    /// Full moon.
    case fullmoon = "fullmoon"

    /// Moon in third quarter.
    case thirdquarter = "thirdquarter"

}
