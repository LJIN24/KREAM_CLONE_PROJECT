//
//  ImageList.swift
//  Kreamclone
//
//  Created by JIN on 7/15/25.
//

import SwiftUI


struct ImageList: View {
    @ObservedObject var viewModel: UploadPostViewModel
    @Binding var imageWidth: CGFloat
    @Binding var imageHeight: CGFloat
    var body: some View {
        
        if viewModel.attachments.isEmpty {
            Image(systemName: "text.below.photo")
                .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .font(.system(size: 150))
                .opacity(0.2)
            
        } else {
            TabView {
                ForEach(viewModel.attachments) { imageAttachment in
                    ZStack(alignment: .center) {
                        ImageAttachmentView(imageWidth: $imageWidth, imageHeight: $imageHeight, imageAttachment: imageAttachment )
                    }.frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                        .background(Color.white)
                }
                
                
            }.frame(height: UIScreen.main.bounds.width)
                .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }
}
