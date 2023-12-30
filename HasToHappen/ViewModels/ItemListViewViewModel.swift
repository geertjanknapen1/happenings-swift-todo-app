//
//  ItemListViewViewModel.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import FirebaseFirestore
import Foundation

/// Viewmodel for list of items
class ItemListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete happening Item from DB
    func delete(id: String) {
        let db = Firestore.firestore()

        db.collection("users")
            .document(userId)
            .collection("happenings")
            .document(id)
            .delete()
    }
    
}
