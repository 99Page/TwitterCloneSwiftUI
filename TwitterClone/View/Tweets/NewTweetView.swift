//
//  NewTweetView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/16.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @Binding var isPresented: Bool
    @State var captionText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack(alignment:. top) {
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
                    
                    TextArea(text: $captionText, placeholder: "What`s happening?")
                    Spacer()
                }
                
                .padding()
                .navigationBarItems(leading: Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }), trailing: Button(action: {}, label: {
                    Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }))
                
                Spacer()
            }
            
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(true))
    }
}
