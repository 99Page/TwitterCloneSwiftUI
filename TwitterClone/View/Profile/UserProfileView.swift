//
//  UserProfileView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/13.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var selectedFilter: TweetFilterOptions = .tweets
    @ObservedObject var viewModel: ProfileViewModel
    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel, isFollowed: $viewModel.isFollowed)
                    .padding()
                FilterButtonView(selectedOption: $selectedFilter)
                
            }
            
            LazyVStack {
                if selectedFilter == TweetFilterOptions.tweets {
                    ForEach(viewModel.userUploadTweets) { tweet in
                        TweetCell(tweet: tweet)
                    }
                } else {
//                    ForEach(0 ..< viewModel.userLikeTweets.count, id: \.self) { i in
//                        TweetCell(tweet: viewModel.userLikeTweets[i], profileViewModelIndex: i)
//                    }
                }
            }
        }
    }
}
