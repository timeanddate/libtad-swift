//
//  AstronomyDataCountry.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Country
/// - SeeAlso: [CountryType] (https://dev.timeanddate.com/docs/type-country)
public struct Country: Codable {

    /// The ISO 3166-1-alpha-2 country code (see [ISO3166]).
    /// - Note: For input parameters, both GB and UK are accepted.
    public let id: String?

    /// Full name of the country.
    public let name: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
