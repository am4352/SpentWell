import Foundation

struct Expense: Codable, Identifiable {
    let id: UUID
    let name: String
    let category: String
    let amount: Double
    let paymentMethod: String
    let type: String
}

let Expenses = [
    Expense(
        id: UUID(),
        name: "Anuj",
        category: "Entertainment",
        amount: 500,
        paymentMethod: "Online",
        type: "Income"
    ),

    Expense(
        id: UUID(),
        name: "Anuj",
        category: "Food",
        amount: 1000,
        paymentMethod: "Cash",
        type: "Expense"
    )
]
