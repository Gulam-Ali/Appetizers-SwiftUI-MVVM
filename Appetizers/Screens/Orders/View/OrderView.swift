//
//  OrderView.swift
//  Appetizers
//
//  Created by Gulam Ali on 04/07/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    List{
                        ForEach(order.SelectedOrders) { appetizer in
                            AppetizerCellView(appetizer: appetizer)
                        }
                        .onDelete { indexset in
                            order.SelectedOrders.remove(atOffsets: indexset)
                        }
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("price tapped")
                    } label: {
                        
                        Text("\(order.totalPrice, specifier: "%.2f") - Order Now")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                            .frame(width: 300, height: 55)
//                            .background(Color("brandPrimary"))
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
                        
                        //or by custom modifier
                            .modifier(StandardButtonStyle())
                        
                    }
                    .padding(.bottom, 20)
                }
                .navigationTitle("Orders")
                
                if order.SelectedOrders.isEmpty{
                    EmptyStateView(message: "No Orders Yet")
                }
                
            }
        }
 
    }
}

