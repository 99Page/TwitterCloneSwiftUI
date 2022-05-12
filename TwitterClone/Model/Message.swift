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
    .init(id: 1, imageName: "person", massageText: "Hey what`s up?", isCurrentUser: false),
    .init(id: 2, imageName: "applelogo", massageText: "Not much, you?", isCurrentUser: true),
    .init(id: 3, imageName: "applelogo", massageText: "How`s the marvel universe?", isCurrentUser: true),
    .init(id: 4, imageName: "person", massageText: "It`s pretty good dude", isCurrentUser: false),
    .init(id: 5, imageName: "person", massageText: "How`s your battle with the joker?", isCurrentUser: false),
    .init(id: 6, imageName: "applelogo", massageText: "Not going so hot...", isCurrentUser: true),
]

