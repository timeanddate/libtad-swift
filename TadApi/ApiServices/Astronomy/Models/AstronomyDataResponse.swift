//
//  AstronomyDataResponse.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Astronomy Service Response
public class AstronomyDataResponse: BaseResponse {

    /// Location data Response
    public let locations: [LocationAstroType]?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case locations = "locations"
    }

    /// :nodoc:
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        locations = try values.decodeIfPresent([LocationAstroType].self, forKey: .locations)
        try super.init(from: decoder)
    }

}
