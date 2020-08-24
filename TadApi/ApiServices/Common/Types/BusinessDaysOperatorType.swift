//
//  BusinessDaysOperatorType.swift
//  TadApi iOS
//
//  Created by Zoltan Tuskes on 15/07/2020.
//  Copyright © 2020 Time and Date. All rights reserved.
//

import Foundation

/// Business Days Operator Type
public enum BusinessDaysOperatorType: String, CaseIterable {

    /// Uses the number specified in parameter to add the days from a start date.
    case add = "add"

    /// Uses the number specified in parameter to subtract the days from a start date.
    case subtract = "subtract"
}
