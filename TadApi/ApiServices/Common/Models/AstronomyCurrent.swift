//
//  AstronomyDataCurrent.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Astronomy Data Current
/// - SeeAlso: [AstronomyCurrentType] (https://dev.timeanddate.com/docs/type-astronomycurrent)
public struct AstronomyCurrent: Codable {

    /// Local time stamp for the data in ISO 8601 format (including UTC offset).
    /// Only returned if requested by specifying the parameter isotime.
    ///     -  Example: 2012-04-17T00:57:42+02:00
    public let isotime: Date?

    /// UTC time stamp for the data in ISO 8601 format.
    /// Only returned if requested by specifying the parameter utctime.
    ///     - Example: 2012-04-16T22:57:42
    public let utctime: Date?

    /// Altitude of the center of the queried astronomical object above an ideal horizon.
    ///     - Type: Integer”
    public let altitude: Float

    /// Horizontal direction of the astronomical object at set/rise time (referring to true north). North is 0 degrees, east is 90 degrees, south is 180 degrees and west is 270 degrees.
    public let azimuth: Float

    /// Distance of the earth's center to the center of the queried astronomical object in kilometers.
    public let distance: Int

    ///The fraction of the Moon's surface illuminated by the Sun's rays as seen from the selected location. Only for the moon for meridian type events.
    public let illuminated: Float?

    /// The counterclockwise angle of the midpoint of the Moon's bright limb as seen from the selected location. Only available for the moon object.
    public let posangle: Float?

    /// The current phase of the moon. Only available for the moon object.
    ///     - SeeAlso:: [Moon Phase] (https://dev.timeanddate.com/docs/type-moonphase)
    public let moonphase: MoonPhase.RawValue

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case altitude = "altitude"
        case azimuth = "azimuth"
        case distance = "distance"
        case isotime = "isotime"
        case utctime = "utctime"
        case illuminated = "illuminated"
        case posangle = "posangle"
        case moonphase = "moonphase"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dateFormatter = DateFormatter.iso8601withFractionalSeconds

        let isoTimeString = try values.decodeIfPresent(String.self, forKey: .isotime)
        if let string = isoTimeString {
            isotime = dateFormatter.date(from: string)
        } else {
            isotime = nil
        }

        let utcTimeString = try values.decodeIfPresent(String.self, forKey: .utctime)
        if let string = utcTimeString {
            utctime = dateFormatter.date(from: string)
        } else {
            utctime = nil
        }

        altitude = try values.decodeIfPresent(Float.self, forKey: .altitude)!
        azimuth = try values.decodeIfPresent(Float.self, forKey: .azimuth)!
        distance = try values.decodeIfPresent(Int.self, forKey: .distance)!
        illuminated = try values.decodeIfPresent(Float.self, forKey: .illuminated)
        posangle = try values.decodeIfPresent(Float.self, forKey: .posangle)
        moonphase = try values.decodeIfPresent(MoonPhase.RawValue.self, forKey: .moonphase)!
    }

}
