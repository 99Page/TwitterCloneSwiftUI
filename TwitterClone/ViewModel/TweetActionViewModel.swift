////
////  TweetActionViewModel.swift
////  TwitterClone
////
////  Created by 노우영 on 2022/06/06.
////
//
//import SwiftUI
//import Firebase
//
//class TweetActionViewModel: ObservableObject {
//    
//    let tweet: Tweet
//    @Published var didLike = false
//    
//    init(tweet: Tweet) {
//        self.tweet = tweet
//        checkIfUserLikeTweet()
//    }
//    
//    func likeTweet() -> Int {
//        
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return 1 }
//        
//        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes + 1]) { _ in
//            COLLECTION_TWEETS.document(self.tweet.id).collection("tweet-likes").document(uid).setData([:]) { _ in
//                COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweet.id).setData([:]) { _ in
//                    self.didLike = true
//                }
//            }
//        }
//        
//        return 1
//    }
//    
//    func unlikeTweet() -> Int {
//        
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return  0}
//        
//        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes - 1]) { _ in
//            COLLECTION_TWEETS.document(self.tweet.id).collection("tweet-likes").document(uid).setData([:]) { _ in
//                COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweet.id).delete() { _ in
//                    self.didLike = false
//                }
//            }
//        }
//        
//        
//        return 0
//    }
//    
//    func checkIfUserLikeTweet() {
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
//        
//        COLLECTION_USERS.document(uid).collection("user-likes").document(tweet.id).getDocument { snapshot, error in
//            guard let didLike = snapshot?.exists else { return }
//            self.didLike = didLike
//        }
//    }
//}
