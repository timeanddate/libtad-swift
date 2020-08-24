//
//  AstronomyDataGeo.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// GeoType
/// The geographical information type. Latitude and Longitude will only be contained in this object if requested (see the geo parameter of the relevant services). The name, state and country members are omitted if the location maps to an uninhabited area.
///- SeeAlso: [GeoType] (https://services.timeanddate.com/api/doc/v3/type-geo.html)
public struct Geo: Codable {

    /// Country of the location.
    public let country: Country?

    /// Geographical latitude of the location.
    public let latitude: Float?

    /// Geographical longitude of the location.
    public let longitude: Float?

    /// The name of the location
    public let name: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case country = "country"
        case latitude = "latitude"
        case longitude = "longitude"
        case name = "name"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decodeIfPresent(Country.self, forKey: .country)
        latitude = try values.decodeIfPresent(Float.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Float.self, forKey: .longitude)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
