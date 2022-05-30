//
//  User.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/27.
//

import Foundation
import Firebase

struct User: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    
    var isCurrentUser: Bool { return  Auth.auth().currentUser?.uid == self.id }
    
    init(dictinoary: [String: Any]) {
        self.id = dictinoary["uid"] as? String ?? ""
        self.username = dictinoary["username"] as? String ?? ""
        self.profileImageUrl = dictinoary["profileImageUrl"] as? String ?? ""
        self.fullname = dictinoary["fullname"] as? String ?? ""
        self.email = dictinoary["email"] as? String ?? ""
    }
}
