//
//  User.swift
//  Kreamclone
//
//  Created by JIN on 6/17/25.
//

import Foundation
import FirebaseFirestore

struct User: Decodable, Identifiable {
    @DocumentID var id: String?
    let email: String
    var username: String
    var profileImageUrl: String?
    var introduction: String?
    let uid: String

}
