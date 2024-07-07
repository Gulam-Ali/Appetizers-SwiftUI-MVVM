//
//  customModifier.swift
//  Appetizers
//
//  Created by Gulam Ali on 07/07/24.
//

import Foundation
import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .font(.title3)
        .fontWeight(.semibold)
        .frame(width: 260, height: 50)
        .background(Color("brandPrimary"))
        .foregroundColor(.white)
        .cornerRadius(10)
    }
    
}

