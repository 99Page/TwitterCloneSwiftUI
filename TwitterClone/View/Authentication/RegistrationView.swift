//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/19.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var binding : [String] = ["", "", "", ""]
    let placeholder  = ["Full name", "Email", "Username", "Password"]
    let imageSource = ["person", "envelope", "person", "lock"]
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack {
            VStack {
                
                Button {
                    showImagePicker.toggle()
                } label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .clipped()
                                .cornerRadius(20)
                                
                        } else {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                        }
                    }
                 
                }
                .padding(.top, 40)
                .foregroundColor(.white)
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: $selectedUIImage)
                }

                
                VStack(spacing: 20) {
                    ForEach(0 ..< 4) { i in
                        CustomTextField(text: $binding[i], placeholder: Text(placeholder[i]), imageSource: imageSource[i])
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                    }
                }
                .padding()
                
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
                
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Text("Already hava an account?")
                            .font(.system(size: 14))
                        
                        Button {
                            
                        } label: {
                            Text("Sign up")
                                .font(.system(size: 14))
                                .bold()
                        }

                        
                    }
                })
                    .padding(.bottom, 40)
                    .foregroundColor(.white)
            }
       
            
        }
        .background(Color.twitterBackgound)
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
