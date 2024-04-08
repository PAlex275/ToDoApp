//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let reatedDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
