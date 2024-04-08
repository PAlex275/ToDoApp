//
//  User.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
