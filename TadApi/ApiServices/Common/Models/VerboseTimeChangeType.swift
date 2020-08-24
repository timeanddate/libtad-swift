//
//  DSTListVerbose.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// VerboseTimeChangeType
/// - SeeAlso: [VerboseTimeChangeType] (https://services.timeanddate.com/api/doc/v3/type-verbosetimechange.html)
public struct VerboseTimeChangeType: Codable {

    /// Local time after transition, split up into components.
    public let newlocaltime: Date?

    /// Local time after transition, split up into components.
    public let oldlocaltime: Date?

    ///Time stamp of transition in UTC time, split up into components.
    public let utctime: Date?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case newlocaltime = "newlocaltime"
        case oldlocaltime = "oldlocaltime"
        case utctime = "utctime"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dateFormatter = DateFormatter.iso8601withFractionalSeconds

        let newlocaltimeString = try values.decodeIfPresent(String.self, forKey: .newlocaltime)
        if let string = newlocaltimeString {
            newlocaltime = dateFormatter.date(from: string)
        } else {
            newlocaltime = nil
        }

        let oldlocaltimeString = try values.decodeIfPresent(String.self, forKey: .oldlocaltime)
        if let string = oldlocaltimeString {
            oldlocaltime = dateFormatter.date(from: string)
        } else {
            oldlocaltime = nil
        }

        let utctimeString = try values.decodeIfPresent(String.self, forKey: .utctime)
        if let string = utctimeString {
            utctime = dateFormatter.date(from: string)
        } else {
            utctime = nil
        }
    }

}
