//
//  DSTListNewlocaltime.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// DateTimeObjectType
/// More Info [DateTimeObjectType](https://services.timeanddate.com/api/doc/v3/type-datetimeobject.html)
public struct DateTimeObjectType: Codable {

        /// Date and time, split up into components.
        ///
        ///     1 Type: DateTimeType
        public let datetime: DateTimeType?

        /// :nodoc:
        enum CodingKeys: String, CodingKey {
                case datetime = "datetime"
        }

        /// :nodoc:
        public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                datetime = try values.decodeIfPresent(DateTimeType.self, forKey: .datetime)
        }

}
