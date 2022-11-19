//
//  ZeroApp.swift
//  Zero
//
//  Created by Ismatilla on 18/11/22.
//

import SwiftUI

@main
struct ZeroApp: App {
    
    @StateObject var homeVm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "isRegistr") {
                Main()
            }
            else {
                ContentView()
            }
        }
    }
}






// App local propperties
public let with = UIScreen.main.bounds.width
public let height = UIScreen.main.bounds.height
