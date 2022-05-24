//
//  CustomSecureField.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/24.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    let imageSource: String
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: imageSource)
                    .resizable()
                    .scaledToFit()
                    .frame(width:20, height:20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(text: .constant(""), placeholder: Text("Email"), imageSource: "envelope")
    }
}
