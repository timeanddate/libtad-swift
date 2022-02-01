//
//  DSTListDstlist.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// DstEntryType
/// - SeeAlso: [DstEntryType] (https://dev.timeanddate.com/docs/type-dstentry)
public struct DstEntryType: Codable {

    /// The geographical region where this information is valid. Contains country, a textual description of the region and the name of the biggest place.
    /// - SeeAlso: [RegionType] (https://dev.timeanddate.com/docs/type-region)
    public let region: DSTListRegion?

    /// Information about the standard time zone. This element is always returned.

    public let stdtimezone: TimeZoneType?

    /// Information about the daylight savings time zone. Suppressed, if there are no DST changes in the queried year.
    /// - Note: Please note that if the region is on daylight savings time for the whole year, this information will be returned in the stdtimezone element. Additionally, the special element will be set to allyear.
    public let dsttimezone: TimeZoneType?

    /// Ending date of daylight savings time. Suppressed, if there are no DST changes in the queried year.
    public let dstend: Date?

    /// Starting date of daylight savings time. Suppressed, if there are no DST changes in the queried year.
    public let dststart: Date?

    /// Time changes (daylight savings time). Only present if requested and information is available.
    public let timechanges: [Timechange]?

    public let special: DSTEntrySpecialType?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case dstend = "dstend"
        case dststart = "dststart"
        case dsttimezone = "dsttimezone"
        case region = "region"
        case stdtimezone = "stdtimezone"
        case timechanges = "timechanges"
        case special = "special"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dateFormatter = DateFormatter.iso8601withFractionalSeconds

        let dstEndString = try values.decodeIfPresent(String.self, forKey: .dstend)
        if let string = dstEndString {
            dstend = dateFormatter.date(from: string)
        } else {
            dstend = nil
        }

        let dstStartString = try values.decodeIfPresent(String.self, forKey: .dststart)
        if let string = dstStartString {
            dststart = dateFormatter.date(from: string)
        } else {
            dststart = nil
        }

        dsttimezone = try values.decodeIfPresent(TimeZoneType.self, forKey: .dsttimezone)
        region = try values.decodeIfPresent(DSTListRegion.self, forKey: .region)
        stdtimezone = try values.decodeIfPresent(TimeZoneType.self, forKey: .stdtimezone)
        timechanges = try values.decodeIfPresent([Timechange].self, forKey: .timechanges)
        special = try values.decodeIfPresent(DSTEntrySpecialType.self, forKey: .special)
    }

}
