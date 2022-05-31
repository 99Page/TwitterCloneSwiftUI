//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/19.


import SwiftUI

enum Registration : Int {
    case email
    case fullName
    case username
    case password
}

struct RegistrationView: View {
    
    @State var binding : [String] = ["", "", "", ""]
    let placeholder  = ["Email", "Fullname", "Username", "Password"]
    let imageSource = ["envelope", "person", "person", "lock"]
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @ObservedObject var viewModel = AuthViewModel()
    
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
                                .clipShape(Circle())
                                .frame(width: 120, height: 120)
                
                                
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
                        if (i == 3) {
                            CustomSecureField(text: $binding[i], placeholder: Text(placeholder[i]), imageSource: imageSource[i])
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        } else {
                            CustomTextField(text: $binding[i], placeholder: Text(placeholder[i]), imageSource: imageSource[i])
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    
                    }
                }
                .padding()
                
                Button {
                    guard let image = selectedUIImage else { return }
                    viewModel.registerUser(email: binding[Registration.email.rawValue], password: binding[Registration.password.rawValue], username: binding[Registration.username.rawValue], fullname: binding[Registration.fullName.rawValue], profileImage: image)
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
