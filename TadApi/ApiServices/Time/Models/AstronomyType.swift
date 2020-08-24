//
//  TimeAstronomy.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// AstronomyType
/// - SeeAlso: [AstronomyType] (https://services.timeanddate.com/api/doc/v3/type-astronomy.html)
public struct AstronomyType: Codable {

    ///  Type: Array of AstronomyObjectType
    public let objects: [AstronomyObjectType]?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case objects = "objects"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        objects = try values.decodeIfPresent([AstronomyObjectType].self, forKey: .objects)
    }

}
