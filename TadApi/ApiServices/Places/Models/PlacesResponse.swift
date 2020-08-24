//
//  PlacesResponse.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// PlacesResponse
/// - SeeAlso: [DstEntrySpecialType] (https://services.timeanddate.com/api/doc/v3/type-dstentryspecial.html)
public class PlacesResponse: BaseResponse {

    /// This element contains a list of all currently known places, their identifiers and their geographical location (if requested).
    let places: [PlaceType]?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case places = "places"
    }

    /// :nodoc:
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        places = try values.decodeIfPresent([PlaceType].self, forKey: .places)
        try super.init(from: decoder)
    }

}
