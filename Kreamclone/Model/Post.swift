//
//  Post.swift
//  Kreamclone
//
//  Created by JIN on 6/24/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

struct Post: Decodable, Identifiable {
    @DocumentID var id: String?
    let ownerImageUrl: String?
    let imageUrl: [String]
    let title: String
    let caption: String
    let ownerUid:String
    let ownerUsername:String
    let timestamp: Timestamp
    var likes: Int
    
    var didLiked: Bool? = false
    var user: User?
}

