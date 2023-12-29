//
//  MainViewViewModel.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import FirebaseAuth
import Foundation

class MainViewViewModel:ObservableObject {
    @Published var currentUserId:String = ""
    
    private var handler: AuthStateDidChangeListenerHandle? // ? Means it is nil (null) by default
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
