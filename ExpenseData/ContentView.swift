//
//  ContentView.swift
//  ExpenseData
//
//  Created by Ravikanth  on 9/29/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) var context
    @State private var isShowingItemSheet = false
    // Query using condition
    @Query(filter: #Predicate<Expense> {$0.value > 1000 }, sort: \Expense.date) var expenses:[Expense]
    // Query using sort
   // @Query(sort: \Expense.date) var expenses:[Expense]
    @State private var expenseToEdit: Expense?
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            expenseToEdit = expense
                        }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(expenses[index])
                    }
                })
            }
            
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet){ AddExpenseSheet() }
            .sheet(item: $expenseToEdit, content: { expense in
                UpdateExpenseSheet(expense: expense)
            })
            .toolbar{
                if !expenses.isEmpty{
                    Button("Add Expense",systemImage: "plus"){
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay{
                if expenses.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Expense", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding expenses to see you list.")
                    } , actions: {
                        Button("Add Expense") {
                            isShowingItemSheet = true
                        }
                    })
                    .offset(y:-60)
                }
            }
        
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Expense.self, inMemory: true)
}
