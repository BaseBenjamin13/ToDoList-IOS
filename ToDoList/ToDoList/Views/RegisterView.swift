//
//  RegisterView.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            HeaderView(
                title: "Register",
                subtitle: "Start organizing todos",
                backgroundColor: .indigo
            )
        }
    }
}

#Preview {
    RegisterView()
}
