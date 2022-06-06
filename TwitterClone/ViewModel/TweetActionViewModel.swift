//
//  TweetActionViewModel.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/06.
//

import SwiftUI
import Firebase

class TweetActionViewModel: ObservableObject {
    
    let tweet: Tweet
    @Published var didLike = false
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet() {
        
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes + 1]) { _ in
            COLLECTION_TWEETS.document(self.tweet.id).collection("tweet-likes").document(uid).setData([:]) { _ in
                COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweet.id).setData([:]) { _ in
                    self.didLike = true
                }
            }
        }
    }
    
    func unlikeTweet() {
        
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes - 1]) { _ in
            COLLECTION_TWEETS.document(self.tweet.id).collection("tweet-likes").document(uid).setData([:]) { _ in
                COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweet.id).setData([:]) { _ in
                    self.didLike = false
                }
            }
        }
        
    }
}
