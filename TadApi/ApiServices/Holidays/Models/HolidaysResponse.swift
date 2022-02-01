//
//  HolidaysResponse.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// HolidaysResponse
/// - SeeAlso: [holidays – Retrieve List of Holidays] (https://dev.timeanddate.com/docs/holidays/holidays-service)
public class HolidaysResponse: BaseResponse {

    /// This element will contain a list of all holiday events within the requested year. If service was queried with calform=full it will also contain an element for every day of the year.
    public let holidays: [HolidayType]?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case holidays = "holidays"
    }

    /// :nodoc:
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        holidays = try values.decodeIfPresent([HolidayType].self, forKey: .holidays)
        try super.init(from: decoder)
    }

}
