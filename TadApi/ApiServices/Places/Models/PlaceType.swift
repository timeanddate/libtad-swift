//
//  PlacesPlace.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// PlaceType
/// - SeeAlso: [PlaceType] (https://dev.timeanddate.com/docs/type-place)
public struct PlaceType: Codable {

    /// Geographical information about the location.
    public let geo: Geo?

    /// Numerical id of the referenced place.
    public let id: String?

    /// Textual id of the referenced place.
    public let urlid: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case geo = "geo"
        case id = "id"
        case urlid = "urlid"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        urlid = try values.decodeIfPresent(String.self, forKey: .urlid)
    }

}
