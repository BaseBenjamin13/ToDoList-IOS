//
//  RegisterView.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subtitle: "Start organizing todos",
                backgroundColor: .indigo
            )
            
            Form {
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create Account",
                    backgroundColor: .indigo
                ) {
                    viewModel.register()
                }
            }
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
