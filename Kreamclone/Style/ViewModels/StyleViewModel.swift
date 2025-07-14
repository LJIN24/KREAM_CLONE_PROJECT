//
//  StyleViewModel.swift
//  Kreamclone
//
//  Created by JIN on 6/25/25.
//

import Foundation

class StyleViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        fetchPosts()
    }
    
    
    func fetchPosts() {
        guard let currentUid = AuthViewModel.shared.currentUser?.uid else { return }
        postRef.whereField("ownerUid", isNotEqualTo:currentUid).getDocuments() { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
        }
    }
}
