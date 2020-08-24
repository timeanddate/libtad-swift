//
//  DSTListRegion.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// DSTListRegion
/// - SeeAlso: [RegionType] (https://services.timeanddate.com/api/doc/v3/type-region.html)
public struct DSTListRegion: Codable {

    /// Name of the biggest city within the region
    public let biggestplace: String?

    /// Type: CountryType
    public let country: Country?

    /// Textual description of a region.
    ///
    ///~~~
    ///     1 Example: All locations
    ///     2 Example: most of Newfoundland and Labrador
    ///     3 Example: some regions of Nunavut Territory; small region of Ontario
    ///~~~
    public let desc: String?

    /// A list of all locations referenced by this region. Only returned if requested by specifying the parameter listplaces.
    public let locations: [DSTListLocation]?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case biggestplace = "biggestplace"
        case country = "country"
        case desc = "desc"
        case locations = "locations"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        biggestplace = try values.decodeIfPresent(String.self, forKey: .biggestplace)
        country =  try values.decodeIfPresent(Country.self, forKey: .country)
        desc = try values.decodeIfPresent(String.self, forKey: .desc)
        locations = try values.decodeIfPresent([DSTListLocation].self, forKey: .locations)
    }

}
