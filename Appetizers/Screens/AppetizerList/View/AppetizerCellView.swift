//
//  AppetizerCellView.swift
//  Appetizers
//
//  Created by Gulam Ali on 04/07/24.
//

import SwiftUI

struct AppetizerCellView: View {
    let appetizer: Appetizer
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading,spacing: 5){
                Text(appetizer.name ?? "")
                    .font(.system(size: 22, weight: .semibold))
                Text("$\(appetizer.price ?? 0.0, specifier: "%.2f")")
                    .fontWeight(.medium)
                    .foregroundColor(Color(.lightGray))
            }
            .padding(.leading)
        }
    }
}

struct AppetizerCellView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCellView(appetizer: MockData.sampleAppetizer)
    }
}
