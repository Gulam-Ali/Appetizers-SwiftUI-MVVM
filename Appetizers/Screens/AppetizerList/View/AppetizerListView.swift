//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Gulam Ali on 04/07/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
  
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers, id: \.id){ appetizer in
                    AppetizerCellView(appetizer: appetizer)
                }
                .listStyle(.plain)
                .navigationTitle("Appetizers")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    

}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
