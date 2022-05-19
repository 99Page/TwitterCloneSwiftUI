//
//  TextArea.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/19.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .padding(4)
            
            if text.isEmpty {
                Text(placeholder)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    .foregroundColor(.gray)
            }
        }
        .font(.body)
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea(text: .constant(""), placeholder: "What`s happening?")
    }
}
