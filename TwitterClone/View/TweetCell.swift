//
//  TweetCell.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/08.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("노우영")
                            .font(.subheadline)
                            .bold()
                        
                        Text("@노한솔")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("3h")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text("5월 8일 일요일 커뮤니티 라운지에서 SwiftUI로 트위터 클론코딩. ")
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

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
