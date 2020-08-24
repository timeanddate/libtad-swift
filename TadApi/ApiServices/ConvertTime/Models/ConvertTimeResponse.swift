//
//  ConvertTimeResponse.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Convert Time Response
/// - SeeAlso: [ConvertTime] (https://services.timeanddate.com/api/doc/v3/srv-converttime.html)
public class ConvertTimeResponse: BaseResponse {

    /// This element contains the time information for the locations in the request. For the XML format, it will be repeated multiple times, while for JSON, it is modeled as an array of objects with the same content.
    /// - SeeAlso: [LocationType] (https://services.timeanddate.com/api/doc/v3/type-location.html)
    public let locations: [LocationType]?

    /// UTC time stamp of requested time.
    public let utc: Utc?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case locations = "locations"
        case utc = "utc"
    }

    /// :nodoc:
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        locations = try values.decodeIfPresent([LocationType].self, forKey: .locations)
        utc = try values.decodeIfPresent(Utc.self, forKey: .utc)
        try super.init(from: decoder)
    }

}
