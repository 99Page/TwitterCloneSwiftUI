//
//  ProfileHeaderView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/13.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "applelogo")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 10, x:0, y:0)
            
            Text("Apple lover")
                .font(.headline)
                .bold()
            
            Text("@tim cook")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("당신은 얼마나 많은 삶을 터치했나요? ")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            HStack(spacing: 40) {
                VStack {
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            ProfileActionButtonView(isMyProfile: true)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
