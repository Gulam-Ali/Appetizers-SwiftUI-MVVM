//
//  ContentView.swift
//  Appetizers
//
//  Created by Gulam Ali on 04/07/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Orders")
                }
        }
        .tint(Color("brandPrimary"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
