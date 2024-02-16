//
//  ContentView.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import SwiftUI

struct MainView: View {
    
    init() {
        print("logged")
    }
    
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
