//
//  PostGridViewModel.swift
//  instagramclone2
//
//  Created by JIN on 5/7/25.
//

import Foundation


class ProfilePostViewModel:ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        
      fetchProfilepost()
        
    }

    
    func fetchProfilepost() {
        let uid = AuthViewModel.shared.currentUser?.uid ?? ""
        postRef.whereField("ownerUid", isEqualTo: uid).getDocuments(){ snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
        }
    }
    
}
