//
//  ProfileView.swift
//  ToDoList
//
//  Created by Alex Petrisor on 06.04.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewVM()

    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loadin profile...")
                }
                
            }.navigationTitle("Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
            //Avatar
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.blue)
                .frame(width: 125, height: 125)
            
            //info : Name, Email, Member since
            VStack(alignment: .leading){
                HStack{
                    Text("Name: ").bold()
                    Text(user.name)
                }.padding()
                HStack{
                    Text("Email: ").bold()
                    Text(user.email)
                }.padding()
                HStack{
                    Text("Member Since: ")
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time: .shortened))")
                }.padding()                }
            Spacer(minLength: 150)
            // Sign out
            TLButton(title: "Log Out",
                     background: .red){
                viewModel.logOut()
            }.frame(width: 300, height: 80)
            Spacer()
        
    }
}

#Preview {
    ProfileView()
}
