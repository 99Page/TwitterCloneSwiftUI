//
//  ConversationView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/09.
//

import SwiftUI

struct ConversationView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                
                VStack {
                    ForEach(0..<20) { _ in
                        ConversationCell()
                    }
                }
            }
            
            Button {
                
            } label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
