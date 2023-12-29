//
//  ListItem.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import Foundation

struct HappeningItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var completed: Bool
    
    mutating func setCompleted(_ state: Bool) {
        completed = state
    }
}
