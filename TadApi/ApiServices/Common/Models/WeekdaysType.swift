//
//  BusinessDateWeekday.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// WeekdaysType
/// - SeeAlso:  [WeekdaysType] (https://dev.timeanddate.com/docs/type-weekdays)
public struct WeekdaysType: Codable {

    /// How many days in total have been counted.
    public let count: Int?

    /// Count for Fridays.
    public let fri: Int?

    /// Count for Mondays.
    public let mon: Int?

    /// Count for Saturdays
    public let sat: Int?

    /// Count for Sundays
    public let sun: Int?

    /// Count for Thursdays.
    public let thu: Int?

    /// Count for Tuesdays.
    public let tue: Int?

    /// Specifies whether or not the weekdays counted were part of an included or excluded filter.
    public let type: String?

    /// Count for Wednesdays.
    public let wed: Int?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case fri = "fri"
        case mon = "mon"
        case sat = "sat"
        case sun = "sun"
        case thu = "thu"
        case tue = "tue"
        case type = "type"
        case wed = "wed"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        fri = try values.decodeIfPresent(Int.self, forKey: .fri)
        mon = try values.decodeIfPresent(Int.self, forKey: .mon)
        sat = try values.decodeIfPresent(Int.self, forKey: .sat)
        sun = try values.decodeIfPresent(Int.self, forKey: .sun)
        thu = try values.decodeIfPresent(Int.self, forKey: .thu)
        tue = try values.decodeIfPresent(Int.self, forKey: .tue)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        wed = try values.decodeIfPresent(Int.self, forKey: .wed)
    }

}
