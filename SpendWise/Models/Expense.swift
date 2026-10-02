//
//  Expense.swift
//  SpendWise
//
//  Created by Anuj Mishra on 27/09/26.
//
import SwiftUI
struct Expense : Identifiable{
    let id = UUID()
    let name : String
    let category : String
    let amount : Double
    let PaymentMethod : String
    let type : String
}

let Expenses = [
    Expense(
        name: "Anuj",
        category: "Entertainment",
        amount: 500,
        PaymentMethod: "Online",
        type: "Income"
    ),
    
    Expense(
        name: "Anuj",
        category: "Food",
        amount: 1000,
        PaymentMethod: "Cash",
        type: "Expensem"
        
    )
]
