//
//  LoginView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/19.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    let emailPlaceholder = "Email"
    let passwordPlaceholder = "Password"
    let emailImage = "envelope"
    
    
    var body: some View {
        
        ZStack {
            VStack {
                Image("twitterLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 100)
                    .clipped()
                    .padding(.top, 60)
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text(emailPlaceholder))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                    
                    CustomTextField(text: $password, placeholder: Text(passwordPlaceholder))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                }
                .padding()
                
                
                Spacer()
            }
       
            
        }
        .background(Color.twitterBackgound)
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
