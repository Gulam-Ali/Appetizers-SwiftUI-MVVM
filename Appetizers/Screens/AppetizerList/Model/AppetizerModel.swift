//
//  AppetizerModel.swift
//  Appetizers
//
//  Created by Gulam Ali on 04/07/24.
//

import Foundation

struct AppetizerResponse: Decodable {
    let request: [Appetizer]?
}

struct Appetizer: Decodable, Identifiable {
    let id: Int?
    let name: String?
    let protein: Int?
    let imageURL: String?
    let price: Double?
    let description: String?
    let calories: Int?
    let carbs: Int?
}

/*
 {
    "name":"Asian Flank Steak",
    "protein":14,
    "id":1,
    "imageURL":"https:\/\/seanallen-course-backend.herokuapp.com\/images\/appetizers\/asian-flank-steak.jpg",
    "carbs":0,
    "price":8.99,
    "description":"This perfectly thin cut just melts in your mouth.",
    "calories":300
 }
 */

//MARK: >>>>>> Mock Data

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 001,
                                           name: "Sample Appetizer",
                                           protein: 24,
                                           imageURL: "",
                                           price: 25.30,
                                           description: "This is my sample appetizer description, This perfectly thin cut just melts in your mouth.",
                                           calories: 600,
                                           carbs: 20)
    
    static let Appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
    
    
    static let sampleAppetizerOne = Appetizer(id: 001,
                                           name: "Sample Appetizer One",
                                           protein: 24,
                                           imageURL: "",
                                           price: 25.30,
                                           description: "This is my sample appetizer description, This perfectly thin cut just melts in your mouth.",
                                           calories: 600,
                                           carbs: 20)
    
    static let sampleAppetizerTwo = Appetizer(id: 002,
                                           name: "Sample Appetizer Two",
                                           protein: 24,
                                           imageURL: "",
                                           price: 25.30,
                                           description: "This is my sample appetizer description, This perfectly thin cut just melts in your mouth.",
                                           calories: 600,
                                           carbs: 20)
    
    static let sampleAppetizerThree = Appetizer(id: 003,
                                           name: "Sampe Appetizer Three",
                                           protein: 24,
                                           imageURL: "",
                                           price: 25.30,
                                           description: "This is my sample appetizer description, This perfectly thin cut just melts in your mouth.",
                                           calories: 600,
                                           carbs: 20)
    
    static let OrdersAppetizers = [sampleAppetizerOne,sampleAppetizerTwo,sampleAppetizerThree]
    
}
