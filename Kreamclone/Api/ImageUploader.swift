//
//  ImageUploader.swift
//  Kreamclone
//
//  Created by JIN on 6/28/25.
//

import Foundation
import UIKit
import FirebaseStorage

enum UploadType {
    case profile
    case post
    
    func filePath() -> StorageReference {
        let filename = NSUUID().uuidString
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        switch self {
        case .profile:
            return storageRef.child("profile_images").child("\(filename)")
        case .post:
            return storageRef.child("post_images").child("\(filename)")
   
        }
    }
}

struct ImageUploader {
    
    static func uploadImage(image: UIImage,type: UploadType, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
    
        let ref = type.filePath()
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Faild to upload data \(error.localizedDescription)")
                return
            }
            
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
