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
    let passwordImage = "lock"
    
    
    var body: some View {
        
        ZStack {
            VStack {
                Image("twitterLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 100)
                    .clipped()
                    .padding(.top, 60)
                
                VStack(spacing: 15) {
                    CustomTextField(text: $email, placeholder: Text(emailPlaceholder), imageSource: emailImage)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                    
                    CustomTextField(text: $password, placeholder: Text(passwordPlaceholder), imageSource: passwordImage)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                }
                .padding()
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Forget Password?")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .bold()
                    }

                }
                .padding(.horizontal)
                
                Button {
                    
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                HStack {
                    Text("Don`t have an account?")
                        .font(.system(size: 14))
                    
                    Button {
                        
                    } label: {
                        Text("Sign up")
                            .font(.system(size: 14))
                            .bold()
                    }

                    
                }
                .padding(.bottom, 40)
                .foregroundColor(.white)
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
