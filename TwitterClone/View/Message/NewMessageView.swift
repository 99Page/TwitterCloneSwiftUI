//
//  NewMessageView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/12.
//

import SwiftUI

struct NewMessageView: View {
    
    @State var seacrhText = ""
    @State var startChat = false
    @Binding var show: Bool
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                SearchBar(text: $seacrhText)
                
                VStack(alignment: .leading) {
                    ForEach(viewModel.users) { user in
                        HStack {
                            Button {
                                self.startChat.toggle()
                                print("startChat toggling : \(startChat.description)")
                            } label: {
                                UserCell(user: user)
                            }
                            Spacer()
                        }
                        
                    }
                }
            }
            
            NavigationLink(isActive: $startChat) {
                ChatView()
                    .onDisappear{
                        self.show.toggle()
                        print("show toggling : \(show.description)")
                    }
            } label: {}
        }
       
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true))
    }
}
