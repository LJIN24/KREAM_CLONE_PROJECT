//
//  StyleViewModel.swift
//  Kreamclone
//
//  Created by JIN on 6/25/25.
//

import Foundation
import Firebase

class StyleViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private var posttListener: ListenerRegistration?
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        postRef.addSnapshotListener { snapshot, error in
            if let error = error {
                print("Error fetching posts: \(error)")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
    
//    func fetchPosts() {
//        postRef.getDocuments() { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
//        }
//    }
}
