//
//  LoginView.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewVM()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List", subTitle: "Get things done", color: .pink, angle: 15)
                
                //Login Form
                Form {
                    if  !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .listRowSeparator(.hidden)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .listRowSeparator(.hidden)
                    
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                }.scrollContentBackground(.hidden)
                
                
                //Create Account
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }.padding(.bottom, 20).padding(.top,20)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
