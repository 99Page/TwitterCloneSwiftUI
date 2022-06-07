//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/05.
//

import SwiftUI
import Firebase
@main
struct TwitterCloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
                .environmentObject(FeedViewModel())
        }
    }
}
