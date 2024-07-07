//
//  Alert.swift
//  Appetizers
//
//  Created by Gulam Ali on 04/07/24.
//

import SwiftUI

struct alertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton : Alert.Button
}


struct AlertContext {
    static let invalidURL = alertItem(title: Text("Invalid URL"), message: Text("Invalid URL"), dismissButton: .default(Text("Ok")))
    static let invalidResponse = alertItem(title: Text("Invalid Response"), message: Text("Invalid Response"), dismissButton: .default(Text("Ok")))
    static let invalidData = alertItem(title: Text("Invalid Data"), message: Text("Invalid Data"), dismissButton: .default(Text("Ok")))
    static let unableToComplete = alertItem(title: Text("Unable to Complete"), message: Text("Unable to Complete"), dismissButton: .default(Text("Ok")))
    static let fieldsMustBeFilled = alertItem(title: Text("Alert"), message: Text("Please fill all the fields"), dismissButton: .default(Text("Ok")))
    static let invalidEmail = alertItem(title: Text("Invalid Email"), message: Text("Please fill all the valid email address"), dismissButton: .default(Text("Ok")))
    static let userSaveSuccess = alertItem(title: Text("User Saved"), message: Text("User information saved successfully"), dismissButton: .default(Text("Ok")))
    static let userSaveFailure = alertItem(title: Text("Alert"), message: Text("Unable to save user information"), dismissButton: .default(Text("Ok")))
    static let userRetrieveFailure = alertItem(title: Text("Alert"), message: Text("Unable to retrieve user information"), dismissButton: .default(Text("Ok")))
}
