//
//  RegisterViewViewModel.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import Foundation

class RegisterViewViewModel: ObservableObject
{
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {
        
    }
}
