//
//  AstronomyDataAstronomy.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Astronomy Data Astronomy
public struct AstronomyDataAstronomy: Codable {

    /// Type: Array of [AstronomyObjectDetailsType](https://services.timeanddate.com/api/doc/v3/type-astronomyobjectdet.html)
    public let objects: [AstronomyObjectDetailsType]?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case objects = "objects"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        objects = try values.decodeIfPresent([AstronomyObjectDetailsType].self, forKey: .objects)
    }

}
