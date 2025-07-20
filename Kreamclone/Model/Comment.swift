//
//  Comment.swift
//  Kreamclone
//
//  Created by JIN on 7/1/25.
//


import Foundation
import Firebase
import FirebaseFirestore

struct Comment: Identifiable, Decodable, Equatable {
    @DocumentID var id: String?
    let comment: String
    let username: String
    let commenterUid: String
    var commenterImageUrl: String?
    let postId:  String
    let timestamp: Timestamp
    
}

