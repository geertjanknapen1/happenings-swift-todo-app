//
//  NewItemViewViewModel.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    init() {}
    
    func save() {
        
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
