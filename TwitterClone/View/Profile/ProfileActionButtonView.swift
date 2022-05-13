//
//  ProfileActionButtonView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/13.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    let isMyProfile: Bool
    
    var body: some View {
        ZStack {
            if isMyProfile {
                Button {
                    
                } label: {
                    Text("Edit profle")
                        .bold()
                        .font(.title3)
                }
                .frame(width: 360, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .cornerRadius(20)
                .shadow(color: .gray, radius: 11, x: 0, y: 0)
            } else {
                HStack {
                    Button {
                        
                    } label: {
                        Text("Following")
                            .bold()
                            .font(.subheadline)
                    }
                    .frame(width: 180, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 11, x: 0, y: 0)
                    
                    Button {
                        
                    } label: {
                        Text("Message")
                            .bold()
                            .font(.subheadline)
                    }
                    .frame(width: 180, height: 40)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 11, x: 0, y: 0)
                }
            }
        }
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView(isMyProfile: true)
    }
}
