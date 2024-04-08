//
//  LoginViewVM.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//
import FirebaseAuth
import Foundation

class LoginViewVM: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {
        
    }
    
    func login(){
        guard validate() else {
            return
        }
        //try logging in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage="Please fill in all fields"
            return false
        }

        // email@foo.com
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
