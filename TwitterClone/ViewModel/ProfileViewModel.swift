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
        checkIfUserIsFollow()
        print("init 호출")
    }
    
    func follow() {
        
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followingRef.document(self.user.id).setData([:]) { _ in
            followersRef.document(currentUid).setData([:]) { _ in
                self.isFollowed = true
            }
        }
        
    }
    
    func unfollow() {
        guard let curretUid = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(curretUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        followersRef.document(user.id).delete { _ in
            followingRef.document(curretUid).delete { _ in
                self.isFollowed = false
            }
        }
    }
    
    func checkIfUserIsFollow() {
        
        guard let curretUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(curretUid).collection("user-following")
        
        followingRef.document(user.id).getDocument { snapshot, _ in
            guard let isFollowed = snapshot?.exists else { return }
            self.isFollowed = isFollowed
        }
        
    }
}
