//
//  UploadPostViewModel.swift
//  Kreamclone
//
//  Created by JIN on 6/28/25.
//

import SwiftUI
import FirebaseCore
import UIKit
import PhotosUI

@MainActor final class UploadPostViewModel: ObservableObject {
    
    
    
    func uploadPost(type: UploadType, caption: String, title: String) async {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        let urls = await addImageUrls()
        
        let data = [
            "imageUrl": urls,
            "likes" : 0,
            "caption" : caption,
            "title" : title,
            "ownerImageUrl" : user.profileImageUrl ?? "",
            "ownerUid" : user.uid,
            "ownerUsername" : user.username,
            "timestamp": Timestamp(date: Date())
        ] as [String : Any]
        
        try? await postRef.document().setData(data)
        
    }
    
    func addImageUrls() async -> [String] {
        return await withTaskGroup(of: String?.self) { group in
            
            for attachment in attachments {
                group.addTask {
                    
                    let image =  await attachment.getUIImage()
                    return await withCheckedContinuation { continuation in
                        
                        ImageUploader.uploadImage(image: image, type: .post) { url in
                            continuation.resume(returning: url)
                            
                        }
                    }
                }
            }
            
            var urls = [String]()
            for await url in group {
                
                if let url {
                    urls.append(url)
                }
            }
            
            return urls
        }
    }
    
    
    
    @MainActor final class ImageAttachment: ObservableObject, Identifiable {
        enum Status {
            case loading
            
            case finished(Image)
            
            case failed(Error)
            
            var isFailed: Bool {
                return switch self {
                case .failed: true
                default: false
                }
            }
        }
        
        enum LoadingError: Error {
            case contentTypeNotSupported
        }
        
        private let pickerItem: PhotosPickerItem
        
        @Published var imageStatus: Status?
        
        
        nonisolated var id: String {
            pickerItem.identifier
        }
        
        init(_ pickerItem: PhotosPickerItem) {
            self.pickerItem = pickerItem
        }
        
        
        func getUIImage() async -> UIImage {
            do {
                if let data = try await pickerItem.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    return uiImage
                } else {
                    throw LoadingError.contentTypeNotSupported
                }
            } catch {
                imageStatus = .failed(error)
                return UIImage()
            }
        }
        
        
        func loadImage() async {
            guard imageStatus == nil || imageStatus?.isFailed == true else {
                return
            }
            
            imageStatus = .loading
            
            do {
                if let data = try await pickerItem.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    imageStatus = .finished(Image(uiImage: uiImage))
                } else {
                    throw LoadingError.contentTypeNotSupported
                }
            } catch {
                imageStatus = .failed(error)
            }
        }
    }
    
    @Published var selection = [PhotosPickerItem]() {
        didSet {
            
            let newAttachments = selection.map { item in
                attachmentByIdentifier[item.identifier] ?? ImageAttachment(item)
            }
            
            let newAttachmentByIdentifier = newAttachments.reduce(into: [:]) { partialResult, attachment in
                partialResult[attachment.id] = attachment
            }
            attachments = newAttachments
            attachmentByIdentifier = newAttachmentByIdentifier
        }
    }
    
    @Published var attachments = [ImageAttachment]()
    
    private var attachmentByIdentifier = [String: ImageAttachment]()
    
}

private extension PhotosPickerItem {
    var identifier: String {
        guard let identifier = itemIdentifier else {
            fatalError("The photos picker lacks a photo library.")
        }
        return identifier
    }
}
