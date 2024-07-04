//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Gulam Ali on 04/07/24.
//

import Foundation
import SwiftUI

final class ImageLoader : ObservableObject{
    
    @Published var image : Image? = nil
    
    func load(imageURL:String){
        NetworkManager.shared.downloadImage(fromUrl: imageURL) { uiImage in
            guard let downloadedImage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: downloadedImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image : Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    var urlString : String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(imageURL: urlString)
            }
    }
}

