//
//  ConvertTimeUtc.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// UtcType
/// - SeeAlso: [UtcType] (https://dev.timeanddate.com/docs/type-utc)
public struct Utc: Codable {

    /// UTC time stamp in ISO8601 format, and (if requested) split into components.
    ///
    /// - SeeAlso: [TimeType] (https://dev.timeanddate.com/docs/type-time)
    public let time: TimeType?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case time = "time"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        time = try values.decodeIfPresent(TimeType.self, forKey: .time)
    }

}
