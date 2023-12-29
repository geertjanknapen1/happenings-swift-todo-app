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
                
            }
            .navigationTitle("Your account")
        }
    }
}

#Preview {
    ProfileView()
}
