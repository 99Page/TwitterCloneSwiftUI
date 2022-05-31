//
//  ProfileViewModel.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/01.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    let user: User
    @Published var isFollowed = false
    
    init (user: User) {
        self.user = user
    }
    
    func follow() {
        
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(self.user.id).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-follwers").document(currentUid).setData([:]) { _ in
                self.isFollowed = true
            }
        }
        
    }
    
    func unfollow() {
        
    }
}
