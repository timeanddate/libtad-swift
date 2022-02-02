//
//  AccountResponse.swift
//  libtad iOS
//
//  Created by Zoltan Tuskes on 02/02/2022.
//  Copyright © 2022 Time and Date. All rights reserved.
//

import Foundation

/// Account service
/// [Account Service](https://dev.timeanddate.com/docs/account-service
public class AccountResponse: BaseResponse {

    /// The account service can be used to query for which licenses you currently have access to, and the number of credits available on your profile.
    let account: Account?

    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case account = "account"
    }

    /// :nodoc:
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        account = try values.decodeIfPresent(Account.self, forKey: .account)
        try super.init(from: decoder)
    }

}
