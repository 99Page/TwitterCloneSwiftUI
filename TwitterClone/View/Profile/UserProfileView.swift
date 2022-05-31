//
//  UserProfileView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/13.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var selectedFilter: TweetFilterOptions = .tweets
    @State private var editProfilePresented = false
    @ObservedObject var viewModel: ProfileViewModel
    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel, editProfilePresented: $editProfilePresented)
                    .padding()
                FilterButtonView(selectedOption: $selectedFilter)
            }
        }
    }
}
