//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Gulam Ali on 04/07/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject{
    
    @Published var appetizers:[Appetizer] = []
    @Published var alertItem : alertItem?
    @Published var isLoading = false
    
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error{
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    
}
