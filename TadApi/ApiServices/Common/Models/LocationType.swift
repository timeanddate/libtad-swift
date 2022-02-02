//
//  ConvertTimeLocation.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// LocationType
/// - SeeAlso:  [LocationType] (https://dev.timeanddate.com/docs/type-location)
///
public struct LocationType: Codable {

    /// Geographical information about the location.
    public let geo: Geo?

    /// The id of the location.
    public let id: String!

    /// The part of the queried placeid that this location matches. Only for the timeservice.
    public let matchparam: String?

    /// Time information about the location. Only present if requested.
    public let time: TimeType?

    /// Time changes (daylight savings time). Only present if requested and information is available.
    public let timechanges: [Timechange]?

    /// Astronomical information – sunrise and sunset times. Only for the timeservice and if requested.
    public let astronomy: [AstronomyType]?

    enum CodingKeys: String, CodingKey {
        case geo = "geo"
        case id = "id"
        case matchparam = "matchparam"
        case time = "time"
        case timechanges = "timechanges"
        case astronomy = "astronomy"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        matchparam = try values.decodeIfPresent(String.self, forKey: .matchparam)
        time = try values.decodeIfPresent(TimeType.self, forKey: .time)
        timechanges = try values.decodeIfPresent([Timechange].self, forKey: .timechanges)
        astronomy = try values.decodeIfPresent([AstronomyType].self, forKey: .astronomy)
    }

}
