//
//  HeaderView.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let color: Color
    let angle: Double
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
            }.padding(.top, 40)
                
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 300)
        .offset(y: -120)
    }
}

#Preview {
    HeaderView(title: "Test", subTitle: "Test", color: .white, angle: 45)
}
