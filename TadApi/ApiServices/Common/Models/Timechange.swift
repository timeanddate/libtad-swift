//
//  DSTListTimechange.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Timechange
/// - SeeAlso: [TimeChange] (https://dev.timeanddate.com/docs/type-timechange)
public struct Timechange: Codable {

    /// New DST offset in seconds. Value will be null/empty if there is no DST for this location.
    ///
    ///     1 Type: Integer (seconds) or null (JSON)
    public let newdst: Int

    /// Local time after transition, formatted as ISO 8601 (see [ISO8601]) time.
    ///
    ///     1 Example: 2011-03-27T03:00:00
    ///     2 Type: String/ISO8601 Timestamp
    public let newlocaltime: Date?

    /// New total offset to UTC in seconds.
    ///
    ///     1 Type: Integer (seconds)
    public let newoffset: Int?

    /// New time zone offset to UTC in seconds if there is a time zone change for this place. Otherwise the value will be null/empty. Time zones changes happen only very rarely, so the field will be null/empty on most occasions.
    ///
    ///     1 Type: Integer (seconds) or null (JSON)
    public let newzone: Int?

    /// Local time after transition, formatted as ISO 8601 (see [ISO8601]) time.
    ///
    ///     1 Example: 2011-03-27T03:00:00
    ///     2 Type: String/ISO8601 Timestamp
    public let oldlocaltime: Date?

    /// Time stamp of transition in UTC time, formatted as ISO 8601 (see [ISO8601]) time.
    ///
    ///     1 Example: 2011-03-27T01:00:00
    ///     2 Type: String/ISO8601 Timestamp
    public let utctime: Date?

    /// Verbose representation of the time stamps.
    ///
    ///     1 Type: VerboseTimeChangeType
    public let verbose: VerboseTimeChangeType?

    enum CodingKeys: String, CodingKey {
        case newdst = "newdst"
        case newlocaltime = "newlocaltime"
        case newoffset = "newoffset"
        case newzone = "newzone"
        case oldlocaltime = "oldlocaltime"
        case utctime = "utctime"
        case verbose = "verbose"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        newdst = try values.decodeIfPresent(Int.self, forKey: .newdst)!

        let dateFormatter = DateFormatter.iso8601withFractionalSeconds

        let newlocaltimeString = try values.decodeIfPresent(String.self, forKey: .newlocaltime)
        if let string = newlocaltimeString {
            newlocaltime = dateFormatter.date(from: string)
        } else {
            newlocaltime = nil
        }

        let utctimeString = try values.decodeIfPresent(String.self, forKey: .utctime)
        if let string = utctimeString {
            utctime = dateFormatter.date(from: string)
        } else {
            utctime = nil
        }

        newoffset = try values.decodeIfPresent(Int.self, forKey: .newoffset)
        newzone = try values.decodeIfPresent(Int.self, forKey: .newzone)
        let oldlocaltimeString = try values.decodeIfPresent(String.self, forKey: .oldlocaltime)
        if let string = oldlocaltimeString {
            oldlocaltime = dateFormatter.date(from: string)
        } else {
            oldlocaltime = nil
        }

        verbose = try values.decodeIfPresent(VerboseTimeChangeType.self, forKey: .verbose)
    }

}
