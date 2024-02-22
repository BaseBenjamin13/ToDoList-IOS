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
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 125, height: 125)
                    .padding()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: ")
                            .bold()
                        Text("Benji")
                    }
                    .padding(5)
                    HStack {
                        Text("Email: ")
                            .bold()
                        Text("BenmoirgiaF")
                    }
                    .padding(5)
                    HStack {
                        Text("Member Since: ")
                            .bold()
                        Text("1776")
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
//                Button {
//                    viewModel.logOut()
//                } label: {
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 10)
//                            .foregroundColor(.black)
//                        
//                        Text("Log Out")
//                            .foregroundColor(.red)
//                            .bold()
//                    }
//                    .frame(width: 150, height: 100)
//                }
////                .foregroundColor(.blue)
//                .padding()

            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
