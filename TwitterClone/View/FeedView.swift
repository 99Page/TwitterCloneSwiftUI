//
//  FeedView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/06.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                
                VStack {
                    ForEach(0..<20) { _ in
                        TweetCell()
                    }
                }
            }
            
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
        
    }
    
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
