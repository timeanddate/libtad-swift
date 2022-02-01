//
//  AstronomyObjectDetailsType.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// AstronomyObjectDetailsType
/// - SeeAlso: [Astronomy Object Details Type](https://dev.timeanddate.com/docs/type-astronomydet)
public struct AstronomyObjectDetailsType: Codable {

    /// The current data for the object. Only if requested. (Astronomy)
    public let current: AstronomyCurrent?

    /// The specific data for the object at isotime/utctime.. (Astrodata)
    public let result: [AstronomyCurrent]?

    /// Lists and wraps all requested days where events are happening.  (Astronomy)
    public let days: [AstronomyDay]?

    /// Object name.
    public let name: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case current = "current"
        case days = "days"
        case name = "name"
        case result = "result"
    }
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        current = try values.decodeIfPresent(AstronomyCurrent.self, forKey: .current)
        days = try values.decodeIfPresent([AstronomyDay].self, forKey: .days)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        result = try values.decodeIfPresent([AstronomyCurrent].self, forKey: .result)
    }

}
