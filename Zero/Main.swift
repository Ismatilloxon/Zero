//
//  Main.swift
//  Zero
//
//  Created by Ismatilla on 19/11/22.
//

import SwiftUI

struct Main: View {
    
    @StateObject var homeVm = HomeViewModel()
    @StateObject var psixologVM = PsixologViewModel()
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Menu", systemImage: "house.fill")
                }
                .environmentObject(self.homeVm)
            
            Test()
                .tabItem {
                    Label("Order", systemImage: "checkmark.rectangle.fill")
                }
            
            Psixolog()
                .tabItem {
                    Label("Psixolog", systemImage: "person")
                } .environmentObject(self.psixologVM)
            
            Chat()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
            
            VideoLesson()
                .tabItem {
                    Label("Psixolog", systemImage: "play.rectangle")
                }
        }.navigationBarBackButtonHidden()
        
            .onAppear {
                UserDefaults.standard.set(true, forKey: "isRegistr")
            }
    }
}
