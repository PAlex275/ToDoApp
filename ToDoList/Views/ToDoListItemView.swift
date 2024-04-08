//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//

import SwiftUI

struct ToDoListItemView: View {
    let item: ToDoListItem
    @StateObject var viewModel = ToDoListItemViewVM()
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle").foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemView(
        item: .init(id: "123",
                    title: "Get milk",
                    dueDate: Date().timeIntervalSince1970,
                    reatedDate: Date().timeIntervalSince1970,
                    isDone: false))
}
