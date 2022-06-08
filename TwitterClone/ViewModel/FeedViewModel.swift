//
//  FeedViewModel.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/02.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        COLLECTION_TWEETS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.tweets = documents.map({ Tweet(dictionary: $0.data())})
        }
    }
    
    func likeTweet(tweet: Tweet) {
        
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_TWEETS.document(tweet.id).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            let tempTweet = Tweet(dictionary: data)
            COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tempTweet.likes + 1]) { _ in
                COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes").document(uid).setData([:]) { _ in
                    COLLECTION_USERS.document(uid).collection("user-likes").document(tweet.id).setData([:]) { _ in
                        
                    }
                }
            }
        }
    }
    
    func unlikeTweet(tweet: Tweet) {
        
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_TWEETS.document(tweet.id).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            let tempTweet = Tweet(dictionary: data)
            COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tempTweet.likes - 1]) { _ in
                COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes").document(uid).delete() { _ in
                    COLLECTION_USERS.document(uid).collection("user-likes").document(tweet.id).delete() { _ in
                    }
                }
            }
        }
    }
}
