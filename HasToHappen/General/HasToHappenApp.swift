//
//  HasToHappenApp.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import FirebaseCore
import SwiftUI

@main
struct HasToHappenApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
