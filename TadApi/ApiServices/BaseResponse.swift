//
//  BaseResponse.swift
//  TadApi iOS
//
//  Created by Zoltan Tuskes on 21/07/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

public class BaseResponse: Codable {
    /// Billing information
    /// Every response will include this element. The value will be set to how many credits the request cost. Usually this will be 1 but in certain cases, like with the astrodata service you may be charged more per request depending on how much data you requested.
    public let billing: Billing?

    /// Version
    /// Every response will include this element. The value will be set to 1 unless the API has to be changed in an incompatible way (i.e. an element was removed, renamed or changed its type – an addition may happen without increase in the version number).
    public let version: Int?

    /// API Service Errors
    /// This element will only be included in the response if errors occurred while processing your request. In this case, the response will not contain further elements.
    public let errors: [String]?

    enum CodingKeys: String, CodingKey {
            case billing = "billing"
            case version = "version"
            case errors = "errors"
    }

    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        billing = try values.decodeIfPresent(Billing.self, forKey: .billing)
        version = try values.decodeIfPresent(Int.self, forKey: .version)
        errors = try values.decodeIfPresent([String].self, forKey: .errors)
    }

}
