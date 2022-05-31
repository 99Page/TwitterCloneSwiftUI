//
//  ProfileHeaderView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/13.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    let viewModel: ProfileViewModel
    @Binding var editProfilePresented: Bool
    
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 10, x:0, y:0)
            
            Text(viewModel.user.fullname)
                .font(.headline)
                .bold()
            
            Text("@\(viewModel.user.username)")
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
             
            ProfileActionButtonView(viewModel: viewModel, editProfilePresented: $editProfilePresented)
        }
    }
}
