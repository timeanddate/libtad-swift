//
//  ConvertTimeTime.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// TimeType
/// - SeeAlso: [TimeType] (https://dev.timeanddate.com/docs/type-time)
public struct TimeType: Codable {

    /// Date and time, split up into components. The element is only present, if the verbosetime parameter is set to 1.
    public let datetime: Date?

    /// ISO representation of date and time, time zone included (see [ISO8601]) if different from UTC. If time is not applicable, only the date is shown.
    ///
    ///~~~
    ///   Example: 2011-06-08T09:18:16+02:00
    ///   Example: 2011-06-08T07:18:16 (UTC time)
    ///   Example: 2011-06-08 (only date)
    ///   Type: String/ISO8601 Timestamp
    ///~~~
    public let iso: Date?

    /// Timezone information. Element is only present if different from UTC and requested by the caller (parameter tz).
    public let timezone: TimeZoneType?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case datetime = "datetime"
        case iso = "iso"
        case timezone = "timezone"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dateFormatter = DateFormatter.iso8601withFractionalSeconds
        let datetimeString = try values.decodeIfPresent(String.self, forKey: .datetime)
        if let string = datetimeString {
            datetime = dateFormatter.date(from: string)
        } else {
            datetime = nil
        }

        let isoString = try values.decodeIfPresent(String.self, forKey: .iso)
        if let string = isoString {
            iso = dateFormatter.date(from: string)
        } else {
            iso = nil
        }
        timezone = try values.decodeIfPresent(TimeZoneType.self, forKey: .timezone)
    }

}
