//
//  Acccount.swift
//  libtad iOS
//
//  Created by Zoltan Tuskes on 02/02/2022.
//  Copyright © 2022 Time and Date. All rights reserved.
//

import Foundation

public struct Account: Codable {
    
    /// The unique identifier for your profile
    public let id: Int?
    
    /// The ISO timestamp the request was made
    public let timestamp: IsoDateType?
    
    ///The number of request credits left on your profile.
    public let requests: Int?
    
    public let packages: [PackageType]?
    
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case timestamp = "timestamp"
        case requests = "requests"
        case packages = "packages"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        timestamp = try values.decodeIfPresent(IsoDateType.self, forKey: .timestamp)
        requests = try values.decodeIfPresent(Int.self, forKey: .requests)
        packages = try values.decodeIfPresent([PackageType].self, forKey: .packages)
        
    }
    
    
    
}
