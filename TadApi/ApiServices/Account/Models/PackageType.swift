//
//  PackageType.swift
//  libtad iOS
//
//  Created by Zoltan Tuskes on 02/02/2022.
//  Copyright © 2022 Time and Date. All rights reserved.
//

import Foundation

/// PackageType
/// - SeeAlso: [PackageType] (https://dev.timeanddate.com/docs/type-package)
public struct PackageType: Codable {
    
    /// The unique product identifier used by timeanddate.com
    /// Example for Holidays Full package: H002
    /// Example for Astronomy Full package: A001
    public let productid: String?
    
    /// The package name as shown on dev-timeanddate.com
    public let name: String?
    
    /// The date the given package was purchased
    public let purchasedate: Date!
    
    /// The date when the given package expires unless renewed
    public let validuntil: Date!
    
    /// If the package is purchased with certain specific parameters, for instance, a limitation on which country for query for, then this property will be filled with those parameters.
    public let parameters: String?
    
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case productid = "productid"
        case name = "name"
        case purchasedate = "purchasedate"
        case validuntil = "validuntil"
        case parameters = "parameters"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productid = try values.decodeIfPresent(String.self, forKey: .productid)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        purchasedate = try values.decodeIfPresent(Date.self, forKey: .purchasedate)
        validuntil = try values.decodeIfPresent(Date.self, forKey: .validuntil)
        parameters = try values.decodeIfPresent(String.self, forKey: .parameters)
    }
    
    
}
