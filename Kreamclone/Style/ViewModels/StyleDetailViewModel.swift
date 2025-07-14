//
//  StyleCellViewModel.swift
//  Kreamclone
//
//  Created by JIN on 7/1/25.
//

import Foundation
import Firebase

class StyleDetailViewModel: ObservableObject {
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        checkIfPostLiked()
        fetchPostUser()
    }
    
    func like() {
        guard let currentUid = AuthViewModel.shared.currentUser?.uid else { return }
        guard let postId = self.post.id else { return }
        postRef.document(postId).collection("post-likes").document(currentUid).setData([:]) { _ in
            userRef.document(currentUid).collection("user-likes").document(postId).setData([:]) { _ in
                
                postRef.document(postId).updateData(["likes" : self.post.likes + 1 ])
                self.post.likes += 1
                self.post.didLiked = true
            }
        }
        
    }
    
    func unlike() {
        guard let currentUid = AuthViewModel.shared.currentUser?.uid else { return }
        guard let postId = self.post.id else { return }
        postRef.document(postId).collection("post-likes").document(currentUid).delete() { _ in
            userRef.document(currentUid).collection("user-likes").document(postId).delete() { _ in
                
                postRef.document(postId).updateData(["likes" : self.post.likes - 1 ])
                self.post.likes -= 1
                self.post.didLiked = false
            }
        }
    }
    
    func checkIfPostLiked() {
        guard let currentUid = AuthViewModel.shared.currentUser?.uid else { return }
        guard let postId = self.post.id else { return }
        postRef.document(postId).collection("post-likes").document(currentUid).getDocument() { snapshot ,_ in
            guard let isliked = snapshot?.exists else { return }
            self.post.didLiked = isliked
        }
    }
    
    func fetchPostUser() {
        userRef.document(post.ownerUid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.post.user = user
          }
    }
}
