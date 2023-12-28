//
//  LoginViewViewModel.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject
{
    @Published var email = ""
    @Published var password = ""
    @Published var hasErr = false
    @Published var errMsg = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        hasErr = false
        errMsg = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            hasErr = true
            errMsg = "Make sure you enter your email and password combination."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            hasErr = true
            errMsg = "Please enter a valid email."
            return false
        }
        
        return true
    }
}
