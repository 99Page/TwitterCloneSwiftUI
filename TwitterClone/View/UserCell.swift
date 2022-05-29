//
//  UserCell.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/09.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
      
    
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFit()
                .frame(width:56, height:56)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.body)
                    .bold()
                
                Text(user.fullname)
                    .font(.body)
            }
        }
        .foregroundColor(.black)
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
