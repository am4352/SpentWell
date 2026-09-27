import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        VStack {
            
            // Heading
            Text("Expense Tracker")
                .bold()
                .font(.largeTitle)
            
            // Filters
            HStack {
                Button("All") {
                    
                }
                
                Button("Daily") {
                    
                }
                
                Button("Weekly") {
                    
                }
            }
            
            Divider()
            
            Text("All")
            
            Spacer()
            
            // Bottom buttons
            HStack {
                Button("Income") {
                    
                }
                
                Button("Expenses") {
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
