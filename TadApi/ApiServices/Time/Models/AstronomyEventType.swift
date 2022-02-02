//
//  TimeEvent.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// AstronomyEventType
/// - SeeAlso:  [AstronomyEventType] (https://dev.timeanddate.com/docs/type-astronomyevent)
public struct AstronomyEventType: Codable {

    /// Hour at which the event is happening (local time).

    public let hour: Int?

    /// Minute at which the event is happening (local time).

    public let minute: Int?

    /// Indicates the type of the event. Returns either `rise` or `set`
    public let type: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case hour = "hour"
        case minute = "minute"
        case type = "type"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hour = try values.decodeIfPresent(Int.self, forKey: .hour)
        minute = try values.decodeIfPresent(Int.self, forKey: .minute)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
