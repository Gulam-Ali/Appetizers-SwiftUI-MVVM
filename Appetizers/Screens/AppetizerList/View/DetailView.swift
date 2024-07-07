//
//  DetailView.swift
//  Appetizers
//
//  Created by Gulam Ali on 05/07/24.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var order : Order
    let appetizer: Appetizer
    @Binding var isShowingDetailView : Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL ?? "")
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 220)
            VStack(){
                Text(appetizer.name ?? "")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description ?? "")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40){
                    MacroView(title: "Protein", value: appetizer.protein ?? 0)
                    MacroView(title: "Carbs", value: appetizer.carbs ?? 0)
                    MacroView(title: "Calorie", value: appetizer.calories ?? 0)
                }
                    
            }
           
            Spacer()
            Button {
                print("order tapped")
                order.add(appetizer)
                isShowingDetailView = false
            } label: {
               
                Text("$\(appetizer.price ?? 0.0, specifier: "%.2f") - Add to Order")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .frame(width: 260, height: 50)
//                    .background(Color("brandPrimary"))
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
                
                // or you can use the below custom modifier
                    .modifier(StandardButtonStyle())
                
            }
            .padding(.bottom, 30)

        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 12)
        .overlay(alignment: .topTrailing) {
            Button {
                print("dismiss Tapped")
                isShowingDetailView = false
            } label: {
                ZStack{
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .foregroundColor(.black)
                        .frame(width: 44,height: 44)
                }
            }

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(false))
    }
}


struct MacroView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
            
            
        }
    }
}
