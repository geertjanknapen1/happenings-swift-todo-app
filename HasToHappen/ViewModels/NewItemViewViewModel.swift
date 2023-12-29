//
//  NewItemViewViewModel.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let happeningId = UUID().uuidString
        let happening = happeningItem(
            id: happeningId,
            title: title,
            dueData: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            completed: false
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("happenings")
            .document(happeningId)
            .setData(happening.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // Check if date is greater than today, -86400 because of timezones (we substract a day)
        // Technically selecting yesterday is possible
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
