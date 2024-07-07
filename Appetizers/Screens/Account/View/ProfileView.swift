//
//  ProfileView.swift
//  Appetizers
//
//  Created by Gulam Ali on 04/07/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedTextfield : formTextField?
    
    enum formTextField {
    case firstname, lastname, email
    }
   
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("First Name", text: $viewModel.user.firstname)
                        .focused($focusedTextfield, equals: .firstname)
                    TextField("Last Name", text: $viewModel.user.lastname)
                        .focused($focusedTextfield, equals: .lastname)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextfield, equals: .email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    DatePicker(selection: $viewModel.user.dateObject, displayedComponents: .date) {
                        Text("Birthday")
                    }
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }

                } header: {
                    Text("Personal Info")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkinBool)
                    Toggle("Frequent Refills", isOn: $viewModel.user.extraRefills)
                } header: {
                    Text("Request Info")
                }
                .tint(Color("brandPrimary"))


            }
            .navigationTitle("Account")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            .onAppear{
                viewModel.retrieveUser()
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
