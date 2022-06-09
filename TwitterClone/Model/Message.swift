//
//  Message.swift
//  TwitterClone
//
//  Created by 노우영 on 2022/05/10.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let massageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 1, imageName: "person", massageText: "I messed up tonight", isCurrentUser: false),
    .init(id: 2, imageName: "applelogo", massageText: "I lost another fight", isCurrentUser: true),
    .init(id: 3, imageName: "applelogo", massageText: "Lost to myself, but I'll just start again", isCurrentUser: true),
    .init(id: 4, imageName: "person", massageText: "I keep falling down", isCurrentUser: false),
    .init(id: 5, imageName: "person", massageText: "I keep on hitting the ground", isCurrentUser: false),
    .init(id: 6, imageName: "applelogo", massageText: "But I always get up now to see what's next", isCurrentUser: true),
]

