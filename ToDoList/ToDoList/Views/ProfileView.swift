//
//  ProfileView.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.pink)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(5)
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(5)
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(5)
        }
        .padding()
        
        Spacer()
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding(60)
    }
    
}

#Preview {
    ProfileView()
}
