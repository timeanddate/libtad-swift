//
//  AstroDataLocation.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// - SeeAlso: [LocationAstroType] (https://dev.timeanddate.com/docs/type-locationastro)
public struct LocationAstroType: Codable {

    /// Requested astronomical information.
    let astronomy: AstroDataAstronomy?

    /// Geographical information about the location.
    let geo: Geo?

    /// The id of the location.
    let id: String!

    /// The part of the queried placeid that this location matches.
    let matchparam: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case astronomy = "astronomy"
        case geo = "geo"
        case id = "id"
        case matchparam = "matchparam"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        astronomy = try values.decodeIfPresent(AstroDataAstronomy.self, forKey: .astronomy)
        geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        matchparam = try values.decodeIfPresent(String.self, forKey: .matchparam)
    }

}
