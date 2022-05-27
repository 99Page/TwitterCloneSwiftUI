//
//  User.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/27.
//

import Foundation

struct User: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    
    init(dictinoary: [String: Any]) {
        self.id = dictinoary["uid"] as? String ?? ""
        self.username = dictinoary["username"] as? String ?? ""
        self.profileImageUrl = dictinoary["profileImageUrl"] as? String ?? ""
        self.fullname = dictinoary["fullname"] as? String ?? ""
        self.email = dictinoary["email"] as? String ?? ""
    }
}
