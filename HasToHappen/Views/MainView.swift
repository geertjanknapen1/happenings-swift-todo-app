//
//  ContentView.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewViewModel()
    
    var body: some View {
        if vm.isSignedIn, !vm.currentUserId.isEmpty {
            mainBottomView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var mainBottomView: some View {
        TabView {
            ItemListView(userId: vm.currentUserId)
                .tabItem {
                    Label("Happenings", systemImage: "list.bullet.clipboard")
                }
            
            ProfileView()
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
