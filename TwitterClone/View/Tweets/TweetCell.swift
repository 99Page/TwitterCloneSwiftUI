//
//  TweetCell.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/08.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    
    @Binding var tweet: Tweet
    let tweetIndex: Int 
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(tweet.fullname)
                            .foregroundColor(.black)
                            .font(.subheadline)
                            .bold()
                        
                        Text("@\(tweet.username)")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("3h")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text(tweet.caption)
                        .foregroundColor(.black)
                        
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
            TweetActionView(tweet: $tweet, tweetIndex: tweetIndex)
            Divider()
        }
        .padding(.bottom)
    }
}
