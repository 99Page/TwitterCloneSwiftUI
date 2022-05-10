//
//  ChatView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/09.
//

import SwiftUI

struct ChatView: View {
    
    @State var messageText: String = ""
    
    @State var MOCK_MESSAGES: [MockMessage] = [
        .init(id: 1, imageName: "person", massageText: "Hey what`s up?", isCurrentUser: false),
        .init(id: 2, imageName: "applelogo", massageText: "Not much, you?", isCurrentUser: true),
        .init(id: 3, imageName: "applelogo", massageText: "How`s the marvel universe?", isCurrentUser: true),
        .init(id: 4, imageName: "person", massageText: "It`s pretty good dude", isCurrentUser: false),
        .init(id: 5, imageName: "person", massageText: "How`s your battle with the joker?", isCurrentUser: false),
        .init(id: 6, imageName: "applelogo", massageText: "Not going so hot...", isCurrentUser: true),
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) { message in
                        HStack {
                            if message.isCurrentUser {
                                Spacer()
                                Text(message.massageText)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(ChatBubble(isFromCurrentUser: true))
                                    .padding(.horizontal)
                            } else {
                                HStack(spacing: 0) {
                                    Image(systemName: message.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:40, height: 40)
                                        .clipShape(Circle())
                                        .padding(.leading, 5)
                                    
                                    Text(message.massageText)
                                        .padding()
                                        .background(Color(.systemGray4))
                                        .clipShape(ChatBubble(isFromCurrentUser: false))
                                        .padding(.horizontal)
                                    
                                }
                                Spacer()
                            }
                          
                        }
                        
                    }
                }
            }
            
            Divider()
            MessageInputView(messageText: $messageText)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
