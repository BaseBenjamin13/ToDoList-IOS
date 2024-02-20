//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date().addingTimeInterval(86400) // == this time tomorrow
    @Published var showAlert = false
    
    init() {}
    
    
    func save() {
        guard canSave else {
            print("hit canSave guard in save func")
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else {
            print("no uId for currentUser / user not logged in")
            return
        }
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // if dueDate >= today.
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
