//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Gulam Ali on 04/07/24.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersList = baseURL + "appetizers"
    private let cache = NSCache<NSString,UIImage>()
    
    func getAppetizers(completed: @escaping(Result<[Appetizer], APError>) -> Void){
        guard let url = URL(string: appetizersList) else {
            completed(.failure(.invalidURL))
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, err in
            if let _ = err  {
                print(err!.localizedDescription)
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
               let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request ?? []))
            }catch(let err){
                print(err.localizedDescription)
                completed(.failure(.unableToComplete))
            }
            
        }
        task.resume()
    }
    
    //By async await
    func getAppetizersByAsyncAwait() async throws -> [Appetizer]{
        guard let url = URL(string: appetizersList) else {
            throw APError.invalidURL
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        do{
           let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request ?? []
        }catch(let err){
            print(err.localizedDescription)
            throw APError.invalidData
        }
    }
    
    func downloadImage(fromUrl url:String, completed: @escaping(UIImage?) -> Void){
        let cacheKey = NSString(string: url)
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let imageURL = URL(string: url) else {
            completed(nil)
            return
        }
        
        let urlRequest = URLRequest(url: imageURL)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, err in
            guard let hasData = data, let image = UIImage(data: hasData) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
        
    }
    
}
