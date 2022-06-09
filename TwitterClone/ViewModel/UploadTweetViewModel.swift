//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/02.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadTweet(caption: String, completion: @escaping ((Error?) -> Void)) {
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
        
        COLLECTION_USERS.document(user.id).collection("tweets").document(docRef.documentID).setData([:])
        docRef.setData(data, completion: completion)
    }
}
