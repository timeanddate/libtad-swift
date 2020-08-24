//
//  AstronomyDataLocation.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Astronomy Data Location
public struct AstronomyDataLocation: Codable {
        ///Astronomical information – sunrise and sunset times. Only for the timeservice and if requested.
        public let astronomy: AstronomyDataAstronomy?
        ///Geographical information about the location.
        public let geo: Geo?
        ///The id of the location.
        public let id: String?
        ///The part of the queried placeid that this location matches. Only for the timeservice.
        public let matchparam: String?

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
                astronomy = try values.decodeIfPresent(AstronomyDataAstronomy.self, forKey: .astronomy)
                geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                matchparam = try values.decodeIfPresent(String.self, forKey: .matchparam)
        }

}
