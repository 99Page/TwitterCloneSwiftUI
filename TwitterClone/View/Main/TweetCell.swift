//
//  TweetCell.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/08.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    
    let tweet: Tweet
    
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
                        .font(.body)
                        
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
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
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.caption)
                        .frame(width: 32, height: 32)

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
            
            Divider()
        }
        .padding(.bottom)
    }
}
