//
//  MessageView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/12.
//

import SwiftUI

struct MessageView: View {
    let message: MockMessage
    
    var body: some View {
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

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: MOCK_MESSAGES[0])
    }
}
