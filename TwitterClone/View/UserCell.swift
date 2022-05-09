//
//  UserCell.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/09.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width:56, height:56)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("No woo young")
                    .font(.body)
                    .bold()
                
                Text("No han sol")
                    .font(.body)
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
