//
//  AstronomyEvent.swift
//  Timeanddate Service
//
//  Created by Zoltan Tuskes on 15/04/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation
/// Astronomy Event Class
public enum EventClass: String, CaseIterable {

    /// Combination of all known classes.
    case all = "all"

    ///The current phase for the place requested. Additional attributes for illumination (moon), azimuth, distance.
    case current = "current"

    /// Day length. Day length is not reported as an event, but as a separate attribute.
    case daylength = "daylength"

    /// Meridian (Noon, highest point) and Anti-Meridian (lowest point) events.
    case meridian = "meridian"

    /// Moon phase events. Additionally to the phase events (only occurring on four days per lunar month), an additional attribute for the current moon phase is reported for every day.
    case phase = "phase"

    /// Set and rise events. Event times take atmospheric refraction into account.
    case setrise = "setrise"

    /// Combination of all 3 twilight classes.
    case alltwilights = "alltwilights"

    /// Civil twilight (-6°).
    case civiltwilight = "civiltwilight"

    /// Nautical twilight (-12°).
    case nauticaltwilight = "nauticaltwilight"

    /// Astronomical twilight (-18°).
    case astronomicaltwilight = "astronomicaltwilight"
}
