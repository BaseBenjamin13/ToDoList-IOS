//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus.circle")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.pink)
                        .font(.system(size: 35))
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView)
            {
                NewItemView(
                    newItemPresented: $viewModel.showingNewItemView
                )
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "2UNjAfXE6SZWKlb0MMqVvE5M2Wz2")
}
