//
//  FeedView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/06.
//

import SwiftUI

struct FeedView: View {
    
    @State var isShowingNewTweetView = false
    @EnvironmentObject var viewModel: FeedViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0..<viewModel.tweets.count, id: \.self) { index in
                        NavigationLink {
                            TweetDetailView(tweet: viewModel.tweets[index], tweetIndex: index)
                        } label: {
                            TweetCell(tweet: viewModel.tweets[index], tweetIndex: index)
                        }
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

//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView()
//    }
//}
