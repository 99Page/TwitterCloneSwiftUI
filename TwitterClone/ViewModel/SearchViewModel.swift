//
//  SearchViewModel.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/06/06.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.map({  User(dictinoary: $0.data())})
        }
    }
}
