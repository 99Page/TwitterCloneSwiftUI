//
//  TweetDetailView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/06.
//

import SwiftUI
import Kingfisher

struct TweetDetailView: View {
    
    @Binding var tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                     
                    Text(tweet.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@\(tweet.username)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.gray)
                }
            }
            
            Text(tweet.caption)
                .font(.system(size: 22))
            
            Text("10:25 PM * 06/03/2022")
                .font(.system(size: 14))
                .foregroundColor(Color.gray)
            
            Divider()
            
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Text("@")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Retweets")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                }
                
                HStack(spacing: 4) {
                    Text("\(tweet.likes)")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            
            Divider()
            TweetActionView(tweet: $tweet)
            
        }
        .padding()
        
        Spacer()
    }
}
