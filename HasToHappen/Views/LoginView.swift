//
//  LoginView.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var showAlert = false
    @StateObject var vm = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                PartialHeaderView(title: "Has to happen", subtitle: "Your simple to-do list", rotationAngle: -15)
                
                Form {
                    TextField("Email", text: $vm.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .foregroundColor(.appText)
                    
                    SecureField("Password", text: $vm.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .foregroundColor(.appText)
                    
                    
                    PartialButton(color: Color.green, textColor: Color.white, text: "Log in") {
                        vm.login()
                    }
                    .padding(10)
                    
                    // Create nicer error messages
                    if !vm.errMsg.isEmpty {
                        Text(vm.errMsg)
                            .foregroundColor(.red)
                    }
                }
                .scrollContentBackground(.hidden)
                .foregroundColor(.appBackground)
                .background(.appBackground)
                
                // Create Account
                VStack {
                    Text("Don't have an account yet?")
                        .padding(.bottom, 5)
                        .padding(.top, 10)
                    
                    NavigationLink(destination: RegisterView(), label: {
                        HStack {
                            Text("Create one here")
                            Image(systemName: "paperplane.fill")
                        }
                    })
                }
                .padding(.bottom, 5)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
