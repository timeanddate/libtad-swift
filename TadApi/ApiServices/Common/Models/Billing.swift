//
//  AstronomyDataBilling.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// :nodoc:
public struct Billing: Codable {

    /// :nodoc:
    public let credits: Int!
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case credits = "credits"
    }
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        credits = try values.decodeIfPresent(Int.self, forKey: .credits)
    }

}
