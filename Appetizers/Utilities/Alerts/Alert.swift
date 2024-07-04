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
}
