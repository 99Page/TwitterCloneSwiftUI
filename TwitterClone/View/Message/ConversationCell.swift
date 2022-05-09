//
//  ConversationCell.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/09.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                
                VStack(alignment: .leading, spacing: 4) {
        
                    Text("노우영")
                        .font(.subheadline)
                        .bold()
                
                    Text("5월 9일 월요일 커뮤니리라운지에서 메세지 셀 타이핑 중")
                        .font(.body)
                        .lineLimit(2)
                        
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical)
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
