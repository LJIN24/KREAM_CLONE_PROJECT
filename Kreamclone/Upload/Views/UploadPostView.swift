//
//  UploadPostView.swift
//  Kreamclone
//
//  Created by JIN on 6/28/25.
//

import SwiftUI

struct UploadPostView: View {
    @Environment(\.dismiss) var dismiss
    @State var imageWidth: CGFloat = 75
    @State var imageHeight: CGFloat = 75
    @State var title: String = ""
    @State var caption: String = ""
    @ObservedObject var viewModel: UploadPostViewModel
    @Binding var isPresented: Bool
    var body: some View {
        VStack(alignment: .leading) {
         HStack {
                ForEach(viewModel.attachments) { attachment in
                    ImageAttachmentView(imageWidth: $imageWidth , imageHeight: $imageHeight, imageAttachment: attachment)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                
            }
            TextField("", text: $title, prompt: Text("제목은 최대 20자 가능합니다...").fontWeight(.bold).foregroundStyle(.secondary))
                .padding(.vertical)
            TextArea(captionText: $caption)
            Divider()
            Spacer()
        }.padding()
            .navigationBarBackButtonHidden(true)
            .navigationTitle("스타일 올리기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button {
                        dismiss()
                    } label: {
                        Image("left")
                            .resizable()
                            .frame(width: 45, height: 45)
                    }
                    
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            await viewModel.uploadPost(type: .post, caption: caption, title: title)
                        }
                        isPresented = false
                    } label: {
                        Text("등록")
                            .fontWeight(.semibold)
                    }
            }
        }
    }
}

