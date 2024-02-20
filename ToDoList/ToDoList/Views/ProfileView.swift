//
//  ProfileView.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewmodel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
