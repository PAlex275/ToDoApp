//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewVM
    @FirestoreQuery var items: [ToDoListItem]

    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewVM(userId: userId))
    }
    var body: some View {
        NavigationView {
            
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions(allowsFullSwipe: true){
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }.tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "SvF8srpnrJSCu2iIwvj3AAxuaoz1")
}
