//
//  DSTListLocation.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// DSTListLocation
/// - SeeAlso: [LocationRefType] (https://dev.timeanddate.com/docs/type-locationref)
public struct DSTListLocation: Codable {

        /// The id of the location.
        public let id: String?

        /// The name of the location
        public let name: String?

        /// The state of the location within the country (only if applicable).
        public let state: String?

        /// :nodoc:
        enum CodingKeys: String, CodingKey {
                case id = "id"
                case name = "name"
                case state = "state"
        }

        /// :nodoc:
        public init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                state = try values.decodeIfPresent(String.self, forKey: .state)
        }

}
