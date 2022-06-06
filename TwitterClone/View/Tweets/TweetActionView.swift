//
//  TweetActionView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/06.
//

import SwiftUI

struct TweetActionView: View {
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
    }
}

struct TweetActionView_Previews: PreviewProvider {
    static var previews: some View {
        TweetActionView()
    }
}
