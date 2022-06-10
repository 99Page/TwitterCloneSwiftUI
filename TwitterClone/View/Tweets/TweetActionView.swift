//
//  TweetActionView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/06.
//

import SwiftUI
import Firebase

struct TweetActionView: View {
    
    @Binding var tweet: Tweet
    @EnvironmentObject var viewModel: FeedViewModel
    let tweetIndex: Int
    //    @ObservedObject var viewModel: TweetActionViewModel
    
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
                tweet.didLike.toggle()
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
        .onAppear {
            viewModel.checkIfUserLikeTweet(idx: tweetIndex)
        }
    }
}

//struct TweetActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetActionView()
//    }
//}
