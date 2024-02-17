//
//  TLButton.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/16/24.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
            
                Text(title)
                    .foregroundColor(Color("MatchThemeColor"))
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title: "Log In", backgroundColor: .blue) {
        print("Attempt Login")
    }
}
