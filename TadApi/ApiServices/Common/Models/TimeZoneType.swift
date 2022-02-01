//
//  ConvertTimeTimezone.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// TimeZoneType
/// - SeeAlso: [TimeZoneType] (https://dev.timeanddate.com/docs/type-timezone)
public struct TimeZoneType: Codable {

    /// The time zone offset (from UTC) in string representation.
    /// Example: +11:00
    public let offset: String?

    /// Abbreviated time zone name.
    /// Example: LHDT
    public let zoneabb: String?

    /// DST component of time zone offset in seconds.
    /// Example: 1800
    public let zonedst: Int?

    /// Full time zone name.
    /// Example: Lord Howe Daylight Time
    public let zonename: String?

    /// Basic time zone offset (without DST) in seconds.
    /// Example: 37800

    public let zoneoffset: Int?

    /// Total offset from UTC in seconds.
    /// Example: 39600
    public let zonetotaloffset: Int?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case zoneabb = "zoneabb"
        case zonedst = "zonedst"
        case zonename = "zonename"
        case zoneoffset = "zoneoffset"
        case zonetotaloffset = "zonetotaloffset"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        offset = try values.decodeIfPresent(String.self, forKey: .offset)
        zoneabb = try values.decodeIfPresent(String.self, forKey: .zoneabb)
        zonedst = try values.decodeIfPresent(Int.self, forKey: .zonedst)
        zonename = try values.decodeIfPresent(String.self, forKey: .zonename)
        zoneoffset = try values.decodeIfPresent(Int.self, forKey: .zoneoffset)
        zonetotaloffset = try values.decodeIfPresent(Int.self, forKey: .zonetotaloffset)
    }

}
