import SwiftUI
struct AddIncomeView: View {
    @Binding var expenses: [Expense]
    @State private var amount = ""
    @State private var categoryPicker = "Rent"
    @State private var paymentMethod = "Cheque"
    @State private var date = Date()
    @State private var note = ""

    var body: some View {
        NavigationStack {
            Form {
                
                Section("Amount") {
                    TextField("Enter the amount", text: $amount)
                }
                
                Section("Category") {
                    Picker("Pick the category", selection: $categoryPicker) {
                        Text("Rent").tag("Rent")
                        Text("Salary").tag("Salary")
                    }
                }
                
                Section("Payment Method") {
                    Picker("Payment Method", selection: $paymentMethod) {
                        Text("Cheque").tag("Cheque")
                        Text("Cash").tag("Cash")
                    }
                }
                
                Section("Date") {
                    DatePicker(
                        "Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                }
                
                Section("Note") {
                    TextField(
                        "What's Your Source of Income",
                        text: $note
                    )
                }
                
                Section {
                    Button {
                        addIncome()
                    } label: {
                        Text("Add Income")
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .navigationTitle("Add Income")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func addIncome() {
        let expense = Expense(
                    name: note,
                    category: categoryPicker,
                    amount: Double(amount) ?? 0,
                    PaymentMethod: paymentMethod,
                    type: "Income"
                )
        print(expense)
        expenses.append(expense)
        amount = ""
        categoryPicker = "Food"
        paymentMethod = "Cash"
           note = ""
        
    }
  

}
#Preview {
    NavigationStack {
        AddIncomeView(
            expenses: .constant([])
        )
    }
}
