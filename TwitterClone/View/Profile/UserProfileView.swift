//
//  UserProfileView.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/13.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
