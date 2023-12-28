//
//  RegisterView.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var vm = RegisterViewViewModel()
    
    var body: some View {
        
        // Header
        PartialHeaderView(title: "Register", subtitle: "And make it happen", rotationAngle: 15)
        
        Form {
            TextField("Name", text: $vm.fullName)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email", text: $vm.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $vm.password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            
            PartialButton(color: Color.green, textColor: Color.white, text: "Register") {
                // Attempt register
            }
            .padding(10)
        }
        .scrollContentBackground(.hidden)
        .foregroundColor(.appBackground)
        .background(.appBackground)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
