//
//  ChatView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/09.
//

import SwiftUI

struct ChatView: View {
    
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(0..<15) { _ in
                        Text("Chat bubble")
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
