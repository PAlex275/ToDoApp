//
//  TLButton.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action : () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundStyle(background)
                Text(title)
                    .foregroundStyle(Color.white)
                    .bold()
            }
        }).padding()
    }
}

#Preview {
    TLButton(title: "Value", background: .pink){
        //action
    }
}
