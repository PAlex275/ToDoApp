//
//  NewItemView.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewVM()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 40)
            
            Form {
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }.padding()
            }.alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and slect due date that is today or newer"))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get:{return true} ,set: {_ in}))
}
