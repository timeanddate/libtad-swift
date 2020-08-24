//
//  AstroDataAstronomy.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// - SeeAlso: [AstronomyDetailsType] (https://services.timeanddate.com/api/doc/v3/type-astronomydet.html)
struct AstroDataAstronomy: Codable {

        /// Type: Array of AstronomyObjectDetailsType
        let objects: [AstronomyObjectDetailsType]?

        /// :nodoc:
        enum CodingKeys: String, CodingKey {
                case objects = "objects"
        }

        /// :nodoc:
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                objects = try values.decodeIfPresent([AstronomyObjectDetailsType].self, forKey: .objects)
        }

}
