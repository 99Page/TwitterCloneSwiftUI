//
//  Tweet.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/02.
//

import Firebase

struct Tweet: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let caption: String
    var likes: Int
    let uid: String
    let timestamp: Timestamp
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    var didLike: Bool
    
    init (dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.uid = dictionary["uid"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        
        var result = false
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(self.id).getDocument { snapshot, error in
            guard let didlike = snapshot?.exists else { return }
            result = didlike
        }
        
        self.didLike = result
    }
}
