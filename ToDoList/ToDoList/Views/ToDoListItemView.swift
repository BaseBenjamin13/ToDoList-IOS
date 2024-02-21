//
//  DoToListItemView.swift
//  ToDoList
//
//  Created by Ben Morgiewicz on 2/15/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                    .font(.title2)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(
                        item.dueDate < Date().timeIntervalSince1970 
                        ? .red
                        : Color(.secondaryLabel)
                    )

            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.square.fill": "square")
                    .foregroundStyle(.pink)
                    .font(.system(size: 30))
                    .padding()
                
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id: "452",
        title: "Get money",
        dueDate: Date().timeIntervalSince1970+10000,
        createdDate: Date().timeIntervalSince1970,
        isDone: false
    ))
}
