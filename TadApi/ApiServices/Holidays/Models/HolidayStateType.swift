//
//  HolidayStateType.swift
//  TadApi
//
//  Created by Zoltan Tuskes on 04/06/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

///HolidayStateType
/// - SeeAlso: [HolidayStateType] (https://services.timeanddate.com/api/doc/v3/type-holidaystate.html)
public struct HolidayStateType: Codable {

    /// An ISO 3166-1 country or ISO 3166-2 country state code (see [ISO3166]).
    /// - Note: Certain countries also list holidays of other (related) countries. At the time of writing, 2019-04-01, the holidays for the following countries may return an ISO3166-1-alpha-2 country code (in parenthesis) instead of an ISO3166-2 country state code.
    ///
    /// Australia
    ///
    ///    - Christmas Island (cx)
    ///    - Norfolk Island (nf)
    ///    - Cocos and Keeling Islands (cc)
    ///    - Heard and McDonald Islands (hm)
    ///
    /// United Kingdom.
    ///
    ///    - Guernsey (gg)
    ///    - Jersey (je)
    ///
    public let iso: String?

    /// Unique id of the state/subdivision.
    public let id: Int?

    /// Abbreviation of the state/subdivision.
    public let abbrev: String?

    /// Common name of the state/subdivision.
    public let name: String?

    /// Eventual exception if the holiday does not affect the whole state/subdivision.
    public let exception: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case iso = "iso"
        case id = "id"
        case abbrev = "abbrev"
        case name = "name"
        case exception = "exception"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iso = try values.decodeIfPresent(String.self, forKey: .iso)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        abbrev = try values.decodeIfPresent(String.self, forKey: .abbrev)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        exception = try values.decodeIfPresent(String.self, forKey: .exception)
    }

}
