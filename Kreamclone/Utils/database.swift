//
//  database.swift
//  Kreamclone
//
//  Created by JIN on 6/18/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

let db = Firestore.firestore()
let userRef = db.collection("users")
let productRef = db.collection("product")
let postRef = db.collection("posts")
let commentRef = db.collection("comments")


