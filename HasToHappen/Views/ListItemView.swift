//
//  ListItemView.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import SwiftUI

struct ListItemView: View {
    @StateObject var vm = ListItemViewViewModel()
    
    let item: HappeningItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .foregroundColor(.appText)
                    .font(.title3)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button {
                vm.toggleCompleted(item: item)
            } label: {
                Image(systemName: item.completed ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ListItemView(item: .init(id: "123", title: "Get eggs", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, completed: false))
}
