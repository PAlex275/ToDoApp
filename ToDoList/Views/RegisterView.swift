//
//  RegisterView.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewVM()
    var body: some View {
        //Header
        HeaderView(title: "Register", 
                   subTitle:"Start organizing todos",
                   color: .orange,
                   angle: -10)
        //Form
        Form {
            TextField("Name", text: $viewModel.fullName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .listRowSeparator(.hidden)
                .autocorrectionDisabled()
            
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .listRowSeparator(.hidden)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
            SecureField("Password", text: $viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle()).listRowSeparator(.hidden)
            TLButton(title: "Create Account", background: .green) {
                //Attempt registration
                viewModel.register()
            }
        }.scrollContentBackground(.hidden)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
