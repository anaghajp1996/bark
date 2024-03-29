//
//  ListViewVM.swift
//  bark
//
//  Created by Anagha K J on 10/01/24.
//
//import SwiftUI

import Foundation
@MainActor
class ListVM: ObservableObject {
    @Published var dogs = [Dog]()
    @Published var isLoading = true
    
    func getBreeds(limit: Int, page: Int) async {
        self.isLoading = true
        var request = URLRequest(url: URL(string: "\(endpoint)/v1/breeds?limit=\(limit)&page=\(page)/ api_key=live_tcRNgK3ha1qi9zQCw4sdiN55G8FDyA6uNQYuxQ3tv8czbT9mKpJmLSeZ544r03e8")!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Dog].self, from: data) {
                    DispatchQueue.main.async {
                        self.dogs = decodedResponse
                        self.isLoading = false
                    }
                }
            }
        }.resume()
    }
}
