//
//  AstronomyDataDay.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Astronomy  Day
/// - SeeAlso: [AstronomyDayType] (https://dev.timeanddate.com/docs/type-astronomyday)
public struct AstronomyDay: Codable {

    /// Date for the current information.
    public let date: Date?

    /// Length of this day (time between sunrise and sunset). If the sun is not up on this day, 00:00:00 will reported. If the sun does not set on this day, the value will read 24:00:00.
    ///     - Attribute only applies for the sun object and if requested.
    public let daylength: String?

    /// Lists all events during the day.
    ///     - Type: Array of AstronomyDayEventType
    public let events: [AstronomyDayEvent]?

    /// Moon phase for the day. Only if requested.
    public let moonphase: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case daylength = "daylength"
        case events = "events"
        case moonphase = "moonphase"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dateFormatter = DateFormatter.iso8601withFractionalSeconds

        let dateString = try values.decodeIfPresent(String.self, forKey: .date)
        if let string = dateString {
            date = dateFormatter.date(from: string)
        } else {
            date = nil
        }

        daylength = try values.decodeIfPresent(String.self, forKey: .daylength)
        events = try values.decodeIfPresent([AstronomyDayEvent].self, forKey: .events)
        moonphase = try values.decodeIfPresent(String.self, forKey: .moonphase)
    }

}
