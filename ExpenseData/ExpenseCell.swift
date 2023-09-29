//
//  ExpenseCell.swift
//  ExpenseData
//
//  Created by Ravikanth  on 9/29/23.
//

import SwiftUI

struct ExpenseCell: View {
    let expense :Expense
    
    var body: some View {
        HStack {
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70,alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.value, format: .currency(code:"USD"))
        }
    }
}

//#Preview {
//    ExpenseCell()
//}
