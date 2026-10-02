import SwiftUI

struct AddExpenseView: View {
    
    // MARK: - Form State
    @Binding var expenses: [Expense]

    @State private var amount = ""
    @State private var category = "Food"
    @State private var PaymentMethod = "Cash"
    @State private var date = Date()
    @State private var note = ""
    
    var body: some View {
        NavigationStack {
            
            Form {
                
                // MARK: Amount
                
                Section("Amount") {
                    TextField("Enter amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                // MARK: Category
                
                Section("Category") {
                    Picker("Category", selection: $category) {
                        Text("Food")
                            .tag("Food")
                        
                        Text("Entertainment")
                            .tag("Entertainment")
                        
                        Text("Travel")
                            .tag("Travel")
                        
                        Text("Shopping")
                            .tag("Shopping")
                        
                        Text("Bills")
                            .tag("Bills")
                        
                        Text("Other")
                            .tag("Other")
                    }
                }
                
                // MARK: Payment Method
                
                Section("Payment Method") {
                    Picker("Payment Method", selection: $PaymentMethod) {
                        Text("Cash")
                            .tag("Cash")
                        
                        Text("Online")
                            .tag("Online")
                        
                        Text("Credit Card")
                            .tag("Credit Card")
                        
                        Text("Debit Card")
                            .tag("Debit Card")
                    }
                }
                
                // MARK: Date
                
                Section("Date") {
                    DatePicker(
                        "Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                }
                
                // MARK: Note
                
                Section("Note") {
                    TextField(
                        "What did you spend on?",
                        text: $note
                    )
                }
                
                // MARK: Save
                
                Section {
                    Button {
                      addExpense()
                    } label: {
                        Text("Add Expense")
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: - Save Expense
    
    private func addExpense() {
        let expense = Expense(
                    name: note,
                    category: category,
                    amount: Double(amount) ?? 0,
                    PaymentMethod: PaymentMethod,
                    type: "Expense"
                )
        print(expense)
        expenses.append(expense)
        amount = ""
           category = "Food"
           PaymentMethod = "Cash"
           note = ""
    }
}

#Preview {
    NavigationStack {
        AddExpenseView(
            expenses: .constant([])
        )
    }
}
