//
//  IsoDateType.swift
//  libtad iOS
//
//  Created by Zoltan Tuskes on 02/02/2022.
//  Copyright © 2022 Time and Date. All rights reserved.
//

import Foundation

/// IsoDateType
public struct IsoDateType: Codable {

    /// UTC time stamp in ISO8601 format, and (if requested) split into components.
    ///
    public let iso: Date?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case iso = "iso"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iso = try values.decodeIfPresent(Date.self, forKey: .iso)
    }

}
