//
//  UpdateExpenseSheet.swift
//  ExpenseData
//
//  Created by Ravikanth  on 9/29/23.
//

import SwiftUI

struct UpdateExpenseSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var expense: Expense
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Expense", text: $expense.name)
                DatePicker("Date", selection: $expense.date,displayedComponents: .date)
                TextField("Value", value: $expense.value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    UpdateExpenseSheet(expense: Expense(name: "New Item", date: .now, value: 100))
}
