//
//  ImageAttachmentView.swift
//  Kreamclone
//
//  Created by JIN on 6/28/25.
//

import SwiftUI

struct ImageAttachmentView: View {
    @Binding var imageWidth: CGFloat
    @Binding var imageHeight: CGFloat
    @ObservedObject var imageAttachment: UploadPostViewModel.ImageAttachment
    
    var body: some View {
        HStack {
            
        switch imageAttachment.imageStatus {
            case .finished(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width:imageWidth, height: imageHeight)
                    .clipped()
            case .failed:
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            default:
                ProgressView()
            }
        }.task {
            await imageAttachment.loadImage()
        }
    }
}
