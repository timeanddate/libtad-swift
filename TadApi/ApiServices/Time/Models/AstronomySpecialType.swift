//
//  AstronomySpecialType.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 04/06/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// AstronomySpecialType
/// - SeeAlso: [AstronomySpecialType] (https://dev.timeanddate.com/docs/type-astronomyspecial)
public struct AstronomySpecialType: Codable {

    /// Indicates if the sun is up or down all day.
    public let type: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
