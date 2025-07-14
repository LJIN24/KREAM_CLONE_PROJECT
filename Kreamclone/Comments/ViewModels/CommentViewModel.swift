//
//  CommentViewModel.swift
//  Kreamclone
//
//  Created by JIN on 7/1/25.
//

import SwiftUI
import Firebase

class CommentViewModel: ObservableObject {
    let post: Post?
    let db = Firestore.firestore()
    private var commentListener: ListenerRegistration?

    @Published var comments = [Comment]()
    
    init(post: Post) {
        self.post = post
        fetchComments()
    }

    func uploadComments(comment: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = self.post?.id else { return }
        
        var data = [
            "username" : user.username,
            "comment" : comment,
            "timestamp" : Timestamp(date: Date()),
            "postId" : postId,
            "commenterUid" : user.uid,
        ] as [String : Any]
        
        if let profileUrl = user.profileImageUrl {
              data["commenterImageUrl"] = profileUrl
          }
        
        commentRef.document().setData(data)
     
    }
    
    func fetchComments() {
        guard let postId = self.post?.id else { return }
        let query = commentRef.whereField("postId", isEqualTo: postId).order(by: "timestamp", descending: false)
        
        self.commentListener = query.addSnapshotListener { [weak self] snapshot, _ in
            guard let self, let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            self.comments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self) }))
        }
    }
    
    deinit {
        commentListener?.remove()
        print("CommentViewModel instance deinitialized")
    }
}
