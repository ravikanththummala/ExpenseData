//
//  Item.swift
//  ExpenseData
//
//  Created by Ravikanth  on 9/29/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
