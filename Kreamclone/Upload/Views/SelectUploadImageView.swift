//
//  UploadPostView.swift
//  Kreamclone
//
//  Created by JIN on 6/26/25.
//

import SwiftUI
import PhotosUI

struct SelectUploadImageView: View {
    @StateObject private var viewModel = UploadPostViewModel()
    @Environment(\.dismiss) var dismiss
    @State var imageWidth: CGFloat = UIScreen.main.bounds.width
    @State var imageHeight: CGFloat = UIScreen.main.bounds.width
    var body: some View {
        
        VStack(spacing: 0) {
            NavigationStack {
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                    
                    Spacer()
                    NavigationLink {
                        UploadPostView(viewModel: viewModel)
                    } label: {
                        Text("다음")
                            .fontWeight(.bold)
                    }
                    
                }.frame(maxWidth: .infinity)
                    .padding(.bottom, 4)
                    .padding(.horizontal)
                
                ImageList(viewModel: viewModel, imageWidth: $imageWidth, imageHeight: $imageHeight)
                
                PhotosPicker(
                    selection: $viewModel.selection,
                    selectionBehavior: .continuousAndOrdered,
                    matching: .images,
                    preferredItemEncoding: .current,
                    photoLibrary: .shared()
                ) {
                    Text("Select Photos")
                }
                .photosPickerStyle(.inline)
                .photosPickerDisabledCapabilities(.selectionActions)
                .photosPickerAccessoryVisibility(.hidden, edges: .all)
                .ignoresSafeArea()
                .frame(height: 280)
                .padding(.top, -8)
                
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
        }
    }
    
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
    
}
