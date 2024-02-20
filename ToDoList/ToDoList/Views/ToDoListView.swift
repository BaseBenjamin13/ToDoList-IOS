//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    print("add todo")
                } label: {
                    Image(systemName: "plus.circle")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.pink)
                        .font(.system(size: 35))
                }
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
