//
//  LoginView.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // header
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get It Done",
                    backgroundColor: .pink
                )
                
                // login
                
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                
                    TLButton(
                        title: "Log In",
                        backgroundColor: .blue
                    ) {
                        print("Attempt Login")
                    }
                }
                
                
                // Register
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(Color.pink)
                        .rotationEffect(Angle(degrees: -15))
                        .brightness(0.15)
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(Color.pink)
                        .rotationEffect(Angle(degrees: 15))
                    
                    VStack {
                        Text("New Around Here?")
                            .foregroundColor(Color("MatchThemeColor"))
                            .font(.system(size: 20))
                            .padding(.bottom, 1)
                        NavigationLink(
                            "Create An Account",
                            destination: RegisterView()
                        )
                        .font(.system(size: 20))
                    }
                    .padding(.bottom, 75)
                }
                .frame(width: UIScreen.main.bounds.width * 3, height: 250)
                .offset(y: 80)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
