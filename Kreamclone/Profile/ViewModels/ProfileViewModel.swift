//
//  ProfileViewModel.swift
//  Kreamclone
//
//  Created by JIN on 6/18/25.
//

import Foundation
import FirebaseFirestore
import UIKit

class ProfileViewModel:ObservableObject {
    @Published var user : User? = AuthViewModel.shared.currentUser
    private let db = Firestore.firestore()
    
    init () {
        fetchUser()
    }
    func fetchUser() {
        guard let uid = AuthViewModel.shared.currentUser?.uid else { return }
        userRef.document(uid).getDocument() { snapshot ,_ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.user = user
        }
    }
    func profileLogout() {
        AuthViewModel.shared.signOut()
    }
    
    func updateUserName(name: String) {
        guard let uid = AuthViewModel.shared.currentUser?.uid else { return }
        userRef.document(uid).updateData(["username": name])
        
        postRef.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let docs = snapshot?.documents else { return }
            
            docs.forEach { doc in
                doc.reference.updateData(["ownerUsername": name])
            }
            
        }
        commentRef.whereField("commenterUid", isEqualTo: uid).getDocuments { snapshot, _ in
            
            guard let docs = snapshot?.documents else { return }
            docs.forEach { doc in
                doc.reference.updateData(["username": name])
            }
        }
        
            self.user?.username = name
            AuthViewModel.shared.currentUser?.username = name
        
    }
    
    func updateUserIntro(intro: String) {
        guard let userId = AuthViewModel.shared.currentUser?.uid else { return }
        userRef.document(userId).updateData(["introduction": intro])
        self.user?.introduction = intro
    }
    
    
    func updateProfileImage(image: UIImage?, type: UploadType) {
        
        guard let uid = AuthViewModel.shared.currentUser?.uid else { return }
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image, type: type) { url in
            
            userRef.document(uid).updateData(["profileImageUrl": url])
            
                self.user?.profileImageUrl = url
                AuthViewModel.shared.currentUser?.profileImageUrl = url
            
               postRef.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                guard let docs = snapshot?.documents else { return }
                
                docs.forEach { doc in
                    doc.reference.updateData(["ownerImageUrl": url])
                }
                
            }
            commentRef.whereField("commenterUid", isEqualTo: uid).getDocuments { snapshot, _ in
                
                guard let docs = snapshot?.documents else { return }
                docs.forEach { doc in
                    doc.reference.updateData(["commenterImageUrl": url])
                }
            }
            
        }
    }
}
