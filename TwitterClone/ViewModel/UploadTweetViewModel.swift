//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/02.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    
    func uploadTweet(caption: String) {
        guard let user = AuthViewModel.shared.user else { return }
        
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = ["uid": user.id,
                                  "caption": caption,
                                  "fullname": user.fullname,
                                  "timestample": Timestamp(date: Date()),
                                  "username": user.username,
                                  "profileImageUrl": user.profileImageUrl,
                                  "likes": 0, 
                                   "id": docRef.documentID]
        
        docRef.setData(data) { _ in
            print("DEBUG[\(self)] : Successfully uploaded tweet")
        }
    }
}
