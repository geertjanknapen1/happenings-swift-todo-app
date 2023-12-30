//
//  ListItemViewViewModel.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// Viewmodel for single item in a List
class ListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleCompleted(item: HappeningItem) {
        var itemCopy = item
        itemCopy.setCompleted(!item.completed)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("happenings")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
