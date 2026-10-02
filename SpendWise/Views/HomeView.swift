import SwiftUI

struct HomeView: View {

    @State private var selectedFilter = "All"
    @State private var expenses: [Expense] = []

    var body: some View {

        NavigationStack {

            VStack(spacing: 0) {

                // Filter
                Picker("Filter", selection: $selectedFilter) {
                    Text("All").tag("All")
                    Text("Daily").tag("Daily")
                    Text("Weekly").tag("Weekly")
                }
                .pickerStyle(.segmented)
                .padding()

                // Transactions
                if expenses.isEmpty {

                    ContentUnavailableView(
                        "No Transactions",
                        systemImage: "list.bullet.rectangle",
                        description: Text("Add an income or expense to get started.")
                    )

                } else {

                    List {
                        ForEach(expenses) { expense in

                            HStack(spacing: 12) {

                                // Icon
                                Image(systemName: icon(for: expense.category))
                                    .font(.title3)
                                    .frame(
                                        width: 40,
                                        height: 40
                                    )
                                    .background(
                                        Color(.secondarySystemBackground)
                                    )
                                    .clipShape(Circle())

                                // Details
                                VStack(alignment: .leading, spacing: 4) {

                                    Text(expense.name)
                                        .font(.body)
                                        .fontWeight(.medium)

                                    Text(expense.category)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()

                                // Amount
                                Text(
                                    expense.type == "Expense"
                                    ? "-₹\(expense.amount, specifier: "%.2f")"
                                    : "+₹\(expense.amount, specifier: "%.2f")"
                                )
                                .fontWeight(.semibold)
                                .foregroundStyle(
                                    expense.type == "Expense"
                                    ? .red
                                    : .green
                                )
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("Expense Tracker")
            .toolbar {

                ToolbarItem(placement: .topBarTrailing) {

                    Menu {

                        NavigationLink {
                            AddIncomeView(expenses: $expenses)
                        } label: {
                            Label("Add Income", systemImage: "plus.circle")
                        }

                        NavigationLink {
                            AddExpenseView(expenses: $expenses)
                        } label: {
                            Label("Add Expense", systemImage: "minus.circle")
                        }

                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    private func icon(for category: String) -> String {

        switch category {

        case "Food":
            return "fork.knife"

        case "Entertainment":
            return "film"

        case "Travel":
            return "car.fill"

        case "Shopping":
            return "bag.fill"

        case "Bills":
            return "doc.text"

        case "Salary":
            return "banknote"

        case "Rent":
            return "house.fill"

        default:
            return "circle.fill"
        }
    }
}


#Preview {
    HomeView()
}
