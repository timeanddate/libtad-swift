//
//  TimeObject.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// AstronomyObjectType
/// - Note: For locations north of the arctic circle, or south of the antarctic circle, the assumptions that there is exactly one sunrise and one sunset event per day, or that the sun will rise before it sets, are not true! Depending on the date, there may be two sunset events on the same day, or the sun first sets and rises shortly after. For an example, see the sunrise and sunset times for Svalbard during the month of August.
/// - SeeAlso: [AstronomyObjectType] (https://services.timeanddate.com/api/doc/v3/type-astronomyobject.html)
public struct AstronomyObjectType: Codable {

    /// Lists all sunrise/sunset events during the day.
    public let events: [AstronomyEventType]?

    /// Object name. Currently, the sun is the only supported astronomical object.
    public let name: String?

    /// This element is only present if there are no astronomical events. In this case it will indicate if the sun is up or down the whole day.
    public let special: AstronomySpecialType?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case events = "events"
        case name = "name"
        case special = "special"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        events = try values.decodeIfPresent([AstronomyEventType].self, forKey: .events)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        special = try values.decodeIfPresent(AstronomySpecialType.self, forKey: .special)
    }

}
