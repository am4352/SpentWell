//
//  ExpenseAPI.swift
//  SpendWise
//
//  Created by Anuj Mishra on 08/10/26.
//

import Foundation

class ExpenseAPI : Encodable {
    
    private let baseURL = "http://localhost:8080"
    
    func createExpense(_ expense: Expense) async throws {
        
        guard let url = URL(
            string: "\(baseURL)/api/expenses/create"
        ) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        request.httpBody = try JSONEncoder().encode(expense)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard httpResponse.statusCode == 201 else {
            throw URLError(.badServerResponse)
        }
    }
}
