//
//  AstronomyDataEvent.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Astronomy Day Event
/// - SeeAlso: [Astronomy Day Event Type](https://services.timeanddate.com/api/doc/v3/type-astronomydayevent.html)
public struct AstronomyDayEvent: Codable {

    /**
     Altitude of the center of the queried astronomical object above an ideal horizon. Only for meridian type events.
     - Type: Float (degrees)
     */
    public let altitude: Float?

    /**
     Horizontal direction of the astronomical object at set/rise time (referring to true north). North is 0 degrees, east is 90 degrees, south is 180 degrees and west is 270 degrees. Only for rise and set type events.
     - Type: Float (degrees)
     */
    public let azimuth: Float

    /**
     Distance of the earth's center to the center of the queried astronomical object in kilometers. Only for meridian type events.
     */
    public let distance: Int?
    /**
     Local time at which the event is happening in ISO 8601 format (including UTC offset). Only returned if requested by specifying the parameter isotime.
     - Type: String/ISO8601 Timestamp
     - Example: 2012-04-17T00:57:42+02:00
     */
    public let isotime: Date?

    /// Indicates the type of the event.
    public let type: AstronomyEventCodes.RawValue?

    /**
     UTC time at which the event is happening in ISO 8601 format. Only returned if requested by specifying the parameter utctime.
     -   Example: 2012-04-16T22:57:42
     */

    public let utctime: Date?
    /**
     The fraction of the Moon's surface illuminated by the Sun's rays as seen from the selected location. Only for the moon for meridian type events.
     */
    public let illuminated: Float?
    /**
     The counterclockwise angle of the midpoint of the Moon's bright limb as seen from the selected location. Only for the moon for meridian type events.
     */
    public let posangle: Float?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case altitude = "altitude"
        case azimuth = "azimuth"
        case distance = "distance"
        case isotime = "isotime"
        case type = "type"
        case utctime = "utctime"
        case illuminated = "illuminated"
        case posangle = "posangle"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dateFormatter = DateFormatter.iso8601withFractionalSeconds

        altitude = try values.decodeIfPresent(Float.self, forKey: .altitude)
        azimuth = try values.decodeIfPresent(Float.self, forKey: .azimuth)!
        distance = try values.decodeIfPresent(Int.self, forKey: .distance)
        let isoTimeString = try values.decodeIfPresent(String.self, forKey: .isotime)

        if let string = isoTimeString {
            isotime = dateFormatter.date(from: string)
        } else {
            isotime = nil
        }

        type = try values.decodeIfPresent(AstronomyEventCodes.RawValue.self, forKey: .type)

        let utcTimeString = try values.decodeIfPresent(String.self, forKey: .utctime)
        if let string = utcTimeString {
            utctime = dateFormatter.date(from: string)
        } else {
            utctime = nil
        }

        illuminated = try values.decodeIfPresent(Float.self, forKey: .illuminated)
        posangle = try values.decodeIfPresent(Float.self, forKey: .posangle)
    }

}
