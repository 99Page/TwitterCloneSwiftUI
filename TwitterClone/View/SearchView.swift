//
//  SearchView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/08.
//

import SwiftUI

struct SearchView: View {
    
    @State var seacrhText = ""
    var body: some View {
        ScrollView {
            SearchBar(text: $seacrhText)
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    HStack {
                        
                        NavigationLink {
                            UserProfileView()
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
