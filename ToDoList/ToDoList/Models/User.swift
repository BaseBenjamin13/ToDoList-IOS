//
//  User.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
