//
//  AstronomyObjectType.swift
//  Timeanddate Service
//
//  Created by Zoltan Tuskes on 15/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Astronomical Object Id
public enum AstroObjectType: String, CaseIterable {

    /// The sun
    case sun = "sun"

    /// The moon
    case moon = "moon"
}
