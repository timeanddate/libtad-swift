//
//  ServiceProtocol.swift
//  TadApi iOS
//
//  Created by Zoltan Tuskes on 05/08/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

public protocol ServiceProtocol {
    var AstronomyRequest: AstronomyRequest { get set }
    var AstronomyDataResponse: AstronomyDataResponse { get set }
}
