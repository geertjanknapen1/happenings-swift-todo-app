//
//  ProfileView.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = vm.user {
                    profile(user: user)
                } else {
                    Text("Loading profile..")
                }
            }
            .navigationTitle("Your account")
        }
        .onAppear {
            vm.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.appHeaderBackground)
            .frame(width: 125, height: 125)
            .padding(10)
        
        VStack(alignment: .leading) {
            HStack {
                Text("Full name: ")
                    .bold()
                Text(user.fullname)
            }
            .padding(.bottom, 5)
            
            HStack {
                Text("Emailaddress: ")
                    .bold()
                Text(user.email)
            }
            .padding(.bottom, 5)
            
            HStack {
                Text("Member Since: ")
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
            }
            .padding(.bottom, 5)
            
            PartialButton(color: Color.red, textColor: Color.white, text: "Log out") {
                vm.logout()
            }
            .padding(10)
            .frame(width: 200, height: 60)
            
            Spacer()
        }
        .padding(10)
    }
}

#Preview {
    ProfileView()
}
