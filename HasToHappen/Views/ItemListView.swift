//
//  ItemListView.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import SwiftUI

struct ItemListView: View {
    @StateObject var vm = ItemListViewViewModel()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Happenings")
            .toolbar{
                Button {
                    // Action here
                    vm.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.green)
                        .bold()
                        .font(.system(size: 25))
                }
            }
            .sheet(isPresented: $vm.showingNewItemView) {
                NewItemView(newItemPresented:  $vm.showingNewItemView)
            }
        }
    }
}

#Preview {
    ItemListView(userId: "")
}
