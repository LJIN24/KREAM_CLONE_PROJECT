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
    @State var isActive : Bool = false
    @State var imageWidth: CGFloat = UIScreen.main.bounds.width
    @State var imageHeight: CGFloat = UIScreen.main.bounds.width
    @Binding var isPresented: Bool
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
                        UploadPostView(viewModel: viewModel, isPresented: $isPresented)
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
    
}
