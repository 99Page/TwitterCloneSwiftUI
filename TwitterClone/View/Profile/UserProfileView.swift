//
//  UserProfileView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/13.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var selectedFilter: TweetFilterOptions = .tweets
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
                    .padding()
                FilterButtonView(selectedOption: $selectedFilter)
            }
        }
    }
}
