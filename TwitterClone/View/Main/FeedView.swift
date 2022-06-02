//
//  FeedView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/06.
//

import SwiftUI

struct FeedView: View {
    
    @State var isShowingNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                
                VStack {
                    ForEach(viewModel.tweets) { tweet in
                        TweetCell(tweet: tweet)
                    }
                    .onDelete { _ in
                        
                    }
                }
            }
            
            Button {
                self.isShowingNewTweetView.toggle()
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
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                NewTweetView(isPresented: $isShowingNewTweetView)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
