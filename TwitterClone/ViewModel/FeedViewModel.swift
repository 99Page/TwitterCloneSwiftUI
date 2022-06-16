//
//  FeedViewModel.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/02.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    
    init() {}
    
    func fetchTweets() {
        
        tweets.removeAll()
        
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_TWEETS.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
//            self.tweets = documents.map { Tweet(dictionary: $0.data()) }
            documents.forEach { tweetSnapshot in
                COLLECTION_USERS.document(uid).collection("user-likes").document(tweetSnapshot.documentID).getDocument { snapshot, _ in
                    guard let didLike = snapshot?.exists else {
                        self.tweets.append(Tweet(dictionary: tweetSnapshot.data()))
                        return
                    }
                    var newTweet = Tweet(dictionary: tweetSnapshot.data())
                    newTweet.didLike = didLike
                    self.tweets.append(newTweet)
                }
            }
        }
    }
    
    func likeTweet(idx: Int) {
        
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_TWEETS.document(tweets[idx].id).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            let tempTweet = Tweet(dictionary: data)
            self.tweets[idx].likes = tempTweet.likes + 1
            COLLECTION_TWEETS.document(self.tweets[idx].id).updateData(["likes": tempTweet.likes + 1]) { _ in
                COLLECTION_TWEETS.document(self.tweets[idx].id).collection("tweet-likes").document(uid).setData([:]) { _ in
                    COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweets[idx].id).setData([:]) { _ in
                        
                    }
                }
            }
        }
    }
    
    func unlikeTweet(idx: Int) {
        
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_TWEETS.document(self.tweets[idx].id).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            let tempTweet = Tweet(dictionary: data)
            self.tweets[idx].likes = tempTweet.likes - 1 
            COLLECTION_TWEETS.document(self.tweets[idx].id).updateData(["likes": tempTweet.likes - 1]) { _ in
                COLLECTION_TWEETS.document(self.tweets[idx].id).collection("tweet-likes").document(uid).delete() { _ in
                    COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweets[idx].id).delete() { _ in
                        
                    }
                }
            }
        }
        
        return 
    }
    
    func checkIfUserLikeTweet(idx: Int) {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }

        COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweets[idx].id).getDocument { snapshot, error in
            guard let didLike = snapshot?.exists else { return }
            self.tweets[idx].didLike = didLike
            print("FeedViewModel Debug - \(self.tweets[idx].caption) : \(self.tweets[idx].didLike)")
        }
    }
}
