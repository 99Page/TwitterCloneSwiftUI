//
//  TweetActionView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/06.
//

import SwiftUI
import Firebase

struct TweetActionView: View {
    
    @EnvironmentObject var viewModel: FeedViewModel
    
    var tweet: Tweet
    
    var tweetIndex: Int {
        viewModel.tweets.firstIndex(where: { $0.id == tweet.id })!
    }
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "bubble.left")
                    .font(.caption)
                    .frame(width: 32, height: 32)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.caption)
                    .frame(width: 32, height: 32)

            }
            
            Spacer()
            Button {
                tweet.didLike ? viewModel.unlikeTweet(idx: tweetIndex) : viewModel.likeTweet(idx: tweetIndex)
                viewModel.tweets[tweetIndex].didLike.toggle()
            } label: {
                Image(systemName: tweet.didLike ? "heart.fill" : "heart")
                    .font(.caption)
                    .frame(width: 32, height: 32)
                    .foregroundColor(tweet.didLike ? .red : .gray)

            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "bookmark")
                    .font(.caption)
                    .frame(width: 32, height: 32)
                
            }
        }
        .padding(.horizontal)
        .foregroundColor(.gray)
    }
}

//struct TweetActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetActionView()
//    }
//}
