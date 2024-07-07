//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Gulam Ali on 06/07/24.
//

import Foundation
import SwiftUI

final class AccountViewModel : ObservableObject {
 
    @AppStorage("user") private var userData : Data?
    @Published var user = User()
    @Published var alertItem : alertItem?
    
    var isValidForm : Bool{
        guard !user.firstname.isEmpty && !user.lastname.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.fieldsMustBeFilled
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {return}
        do{
           let encoder = JSONEncoder()
            let encodedUser = try encoder.encode(user)
            userData = encodedUser
            alertItem = AlertContext.userSaveSuccess
        }catch(let err){
            print(err.localizedDescription)
            alertItem = AlertContext.userSaveFailure
        }
    }
    
    func retrieveUser(){
        guard let hasUserData = userData else {return}
        do{
           let decoder = JSONDecoder()
            let decodedUser = try decoder.decode(User.self, from: hasUserData)
            user = decodedUser
        }catch(let err){
            print(err.localizedDescription)
            alertItem = AlertContext.userRetrieveFailure
        }
    }
    
}
