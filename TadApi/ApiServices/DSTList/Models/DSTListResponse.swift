//
//  DSTListResponse.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// DST List Response Object
/// - SeeAlso: [dstlist – Retrieve Daylight Saving Time Information] (https://services.timeanddate.com/api/doc/v3/srv-dstlist.html)

public class DSTListResponse: BaseResponse {

    /// The DST information for each country or region.
    let dstlist: [DstEntryType]?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case dstlist = "dstlist"
    }

    /// :nodoc:
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dstlist = try values.decodeIfPresent([DstEntryType].self, forKey: .dstlist)
        try super.init(from: decoder)
    }

}
