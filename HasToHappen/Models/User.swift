//
//  User.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let fullname: String
    let email: String
    let joined: TimeInterval
}
