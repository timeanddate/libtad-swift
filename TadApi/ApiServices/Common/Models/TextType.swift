//
//  BusinessDateName.swift
//
//  Created by Zoltan Tuskes on 26/03/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// TextType
/// - SeeAlso: [Text] (https://services.timeanddate.com/api/doc/v3/type-text.html)
public struct TextType: Codable {

    /// ISO 639 ([ISO639])language code for this text.
    /// Example: en
    public let lang: String?

    /// The actual text.
    public let text: String?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case lang = "lang"
        case text = "text"
    }

    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lang = try values.decodeIfPresent(String.self, forKey: .lang)
        text = try values.decodeIfPresent(String.self, forKey: .text)
    }

}
