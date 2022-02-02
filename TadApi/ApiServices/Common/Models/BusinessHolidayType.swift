//
//  BusinessDateHoliday.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// BusinessHolidayType
/// - SeeAlso: [BusinessHolidayType] (https://dev.timeanddate.com/docs/type-businessholiday)
public struct BusinessHolidayType: Codable {

    /// The number of holidays in the results.
    public let count: Int!

    /// Holidays which occur in the requested period.
    /// - Note: this element contains a minified version of the HolidayType. The name, IDs, URL and date will be present, but no location specific data. See holidays service for retrieving more extensive holiday data using the IDs present in this type.
    public let list: [HolidayType]?

    /// Either included or excluded, specifying whether or not the holidays in the result array were included or excluded when queried.
    public let type: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case list = "list"
        case type = "type"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        list = try values.decodeIfPresent([HolidayType].self, forKey: .list)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
