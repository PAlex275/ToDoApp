//
//  ToDoListViewVM.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//
import FirebaseFirestore
import Foundation

class ToDoListViewVM: ObservableObject{
    @Published var showingNewItemView = false
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    
    func showNewItemView(show: Bool) {
        showingNewItemView = show
    }
    func delete(id: String ){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
