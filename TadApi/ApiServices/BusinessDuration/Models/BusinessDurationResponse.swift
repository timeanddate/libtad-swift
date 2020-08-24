//
//  BusinessDurationResponse.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

public class BusinessDurationResponse: BaseResponse {

        /// Geographical information about the location.
        let geo: Geo?

        /// This will contain the calculated result for the requested period.
        let period: Period?

        /// :nodoc:
        enum CodingKeys: String, CodingKey {
                case geo = "geo"
                case period = "period"
        }

        /// :nodoc:
        public required init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                geo = try values.decodeIfPresent(Geo.self, forKey: .geo)
                period = try values.decodeIfPresent(Period.self, forKey: .period)
                try super.init(from: decoder)
        }

}
