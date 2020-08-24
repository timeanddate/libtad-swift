//
//  BusinessDateRequest.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// BusinessDateResponse Object
public class BusinessDateResponse: BaseResponse {

    /// Geographical information about the location.
    public let geo: Geo?

    /// This array will contain the calculated result for the requested period. For the XML format, it will be repeated multiple times, while for JSON, it is modeled as an array of objects with the same content.
    public let periods: [Period]?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case geo = "geo"
        case periods = "periods"
    }

    /// :nodoc:
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
        periods = try values.decodeIfPresent([Period].self, forKey: .periods)
        try super.init(from: decoder)
    }

}
