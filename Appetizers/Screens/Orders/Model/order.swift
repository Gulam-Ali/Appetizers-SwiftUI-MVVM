//
//  order.swift
//  Appetizers
//
//  Created by Gulam Ali on 07/07/24.
//

import Foundation
import SwiftUI

final class Order : ObservableObject{
    
    @Published var SelectedOrders = [Appetizer]()
    
    var totalPrice : Double{
        return SelectedOrders.reduce(0) {
            $0 + ($1.price ?? 0.0)
        }
    }
    
    func add(_ appetizer: Appetizer){
        SelectedOrders.append(appetizer)
    }
    
}
