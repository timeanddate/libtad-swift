//
//  DSTEntrySpecialType.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 04/06/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// DstEntrySpecialType
/// - SeeAlso: [DstEntrySpecialType] (https://dev.timeanddate.com/docs/type-dstentry)
public struct DSTEntrySpecialType: Codable {

    /// Indicates if the region does not observe DST at all, or is on DST all year long.
    public let type: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
