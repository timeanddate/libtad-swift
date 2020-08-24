//
//  TimeResponse.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Time Service Resőponse
/// - SeeAlso: [timeservice – Retrieve Current Time for Place] (https://services.timeanddate.com/api/doc/v3/srv-timeservice.html)
public class TimeResponse: BaseResponse {

        /// This element contains the response data. Iit is modeled as an array of objects with the same content.
        ///
        ///     1 Type: Array of LocationType
        public let locations: [LocationType]?

        /// :nodoc:
        enum CodingKeys: String, CodingKey {
                case locations = "locations"
        }

        /// :nodoc:
        public required init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                locations = try values.decodeIfPresent([LocationType].self, forKey: .locations)
                try super.init(from: decoder)
        }

}
