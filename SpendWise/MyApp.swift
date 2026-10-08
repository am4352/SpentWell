import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                InsightsView()
                    .tabItem {
                        Label("Insights", systemImage: "chart.pie")
                    }
                
                TransactionsView()
                    .tabItem {
                        Label("Transactions", systemImage: "doc.text")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
        }
    }
}
