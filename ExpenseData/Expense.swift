//
//  Expense.swift
//  ExpenseData
//
//  Created by Ravikanth  on 9/29/23.
//

import Foundation
import SwiftData

@Model
class Expense {
    
    var name: String
    var date: Date
    var value: Double
    
    init(name: String, date: Date, value: Double) {
        self.name = name
        self.date = date
        self.value = value
    }
}
