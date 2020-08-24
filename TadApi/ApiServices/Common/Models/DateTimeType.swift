//
//  ConvertTimeDatetime.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// DateTimeType
/// More Info: [DateTimeType] (https://services.timeanddate.com/api/doc/v3/type-datetime.html)
public struct DateTimeType: Codable {

        /// The day component of the time stamp.
        ///
        ///     1 Type: Integer
        public let day: Int?

        /// The hour component of the time stamp.
        ///
        ///     1 Type: Integer
        public let hour: Int?

        /// The minut component of the time stamp.
        ///
        ///     1 Type: Integer
        public let minute: Int?

        /// The month component of the time stamp.
        ///
        ///     1 Type: Integer
        public let month: Int?

        /// The second component of the time stamp.
        ///
        ///     1 Type: Integer
        public let second: Int?

        /// The year component of the time stamp.
        ///
        ///     1 Type: Integer
        public let year: Int?

         /// :nodoc:
        enum CodingKeys: String, CodingKey {
                case day = "day"
                case hour = "hour"
                case minute = "minute"
                case month = "month"
                case second = "second"
                case year = "year"
        }

        /// :nodoc:
        public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                day = try values.decodeIfPresent(Int.self, forKey: .day)
                hour = try values.decodeIfPresent(Int.self, forKey: .hour)
                minute = try values.decodeIfPresent(Int.self, forKey: .minute)
                month = try values.decodeIfPresent(Int.self, forKey: .month)
                second = try values.decodeIfPresent(Int.self, forKey: .second)
                year = try values.decodeIfPresent(Int.self, forKey: .year)
        }

}
