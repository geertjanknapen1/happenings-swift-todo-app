//
//  ItemListView.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ItemListView: View {
    @StateObject var vm = ItemListViewViewModel()
    @FirestoreQuery var happenings: [HappeningItem]
    
    init(userId: String) {
        self._happenings = FirestoreQuery(collectionPath: "users/\(userId)/happenings")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(happenings) { happening in
                    ListItemView(item: happening)
                        .swipeActions {
                            Button("Delete") {
                                vm.delete(id: happening.id)
                            }
                            .background(.red)
                        }
                }
                .listStyle(PlainListStyle())
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
    ItemListView(userId: "TVJTqQw34rYZdYPmbVIJH7PdC1P2")
}
