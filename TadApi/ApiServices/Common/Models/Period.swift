//
//  BusinessDatePeriod.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// - SeeAlso: [PeriodType] (https://services.timeanddate.com/api/doc/v3/type-period.html)
public struct Period: Codable {

    /// Number of days calculated.
    public let includeddays: Int!

    /// Number of calendar days in calculated period.
    public let calendardays: Int!

    /// Number of days which was skipped in the calculated period.
    public let skippeddays: Int!

    /// The date the calculation started from.
    /// - SeeAlso: [TimeType] (https://services.timeanddate.com/api/doc/v3/type-time.html)
    public let startdate: TimeType!

    /// The date the calculation ended on.
    /// - SeeAlso: [TimeType] (https://services.timeanddate.com/api/doc/v3/type-time.html)
    public let enddate: TimeType!

    /// Holidays which occur in the requested period.
    /// - SeeAlso: [BusinessHolidayType] (https://services.timeanddate.com/api/doc/v3/type-businessholiday.html)
    public let holidays: BusinessHolidayType?

    /// The spread of excluded or included weekdays in includeddays.
    /// - SeeAlso: [WeekdaysType] (https://services.timeanddate.com/api/doc/v3/type-weekdays.html)
    public let weekdays: WeekdaysType!

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case calendardays = "calendardays"
        case enddate = "enddate"
        case holidays = "holidays"
        case includeddays = "includeddays"
        case skippeddays = "skippeddays"
        case startdate = "startdate"
        case weekdays = "weekdays"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        calendardays = try values.decodeIfPresent(Int.self, forKey: .calendardays)
        enddate = try values.decodeIfPresent(TimeType.self, forKey: .enddate)
        holidays = try values.decodeIfPresent(BusinessHolidayType.self, forKey: .holidays)
        includeddays = try values.decodeIfPresent(Int.self, forKey: .includeddays)
        skippeddays = try values.decodeIfPresent(Int.self, forKey: .skippeddays)
        startdate = try values.decodeIfPresent(TimeType.self, forKey: .startdate)
        weekdays = try values.decodeIfPresent(WeekdaysType.self, forKey: .weekdays)
    }

}
