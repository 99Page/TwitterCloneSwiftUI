//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/23.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    func login() {
        
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        print("DEBUG: Email is \(email)")
        print("DEBUG: Password is \(password)")
    }
}
