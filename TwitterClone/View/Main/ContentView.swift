//
//  ContentView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/05.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                NavigationView {
                    TabView {
                        
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        ConversationView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Message")
                            }
                    }
                    .navigationTitle("홈 화면")
                    .navigationBarItems(leading: Button(action: {
                        viewModel.signOut()
                    }, label: {
                        KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 32, height: 32)
                            .cornerRadius(16)
                    }))
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
