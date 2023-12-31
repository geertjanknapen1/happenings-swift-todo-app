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
                .foregroundColor(.appText)
            
            TextField("Email", text: $vm.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
                .foregroundColor(.appText)
            
            SecureField("Password", text: $vm.password)
                .textFieldStyle(DefaultTextFieldStyle())
                .foregroundColor(.appText)
            
            
            PartialButton(color: Color.green, textColor: Color.white, text: "Register") {
                vm.register()
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
