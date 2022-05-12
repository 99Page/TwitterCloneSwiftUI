//
//  NewMessageView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/12.
//

import SwiftUI

struct NewMessageView: View {
    @State var seacrhText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    
    var body: some View {
        ScrollView {
            SearchBar(text: $seacrhText)
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    HStack {
                        Button {
                            self.show.toggle()
                            self.startChat.toggle()
                        } label: {
                            UserCell()
                        }
                        Spacer()
                    }
                    
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
