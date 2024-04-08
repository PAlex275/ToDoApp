//
//  ToDoListItemViewVM.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class ToDoListItemViewVM: ObservableObject{
    init() {}
    
    func toggleIsDone(item: ToDoListItem)  {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        var db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
