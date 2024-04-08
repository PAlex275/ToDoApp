//
//  MainViewVM.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//
import FirebaseAuth
import Foundation

class MainViewVM: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{_, user in
            self.currentUserId = user?.uid ?? ""
        }
    }
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
