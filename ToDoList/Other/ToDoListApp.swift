//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//

import FirebaseCore
import SwiftUI


@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
