//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMsg = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        print("Attempt login")
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMsg = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Please enter a valid email."
            return false
        }
        
        return true
    }
}
