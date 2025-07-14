//
//  CommentBarView.swift
//  Kreamclone
//
//  Created by JIN on 7/1/25.
//

import SwiftUI

struct CommentBarView: View {
    @ObservedObject var viewModel: CommentViewModel
    @State private var commentText: String = ""
    
    private let actions: [String] = [
        ("좋아요 ❤️"),
        ("맞팔해요 😃"),
        ("정보 부탁해요 🙏"),
        ("평소 사이즈? 👉")
    ]

    var body: some View {
 
        VStack(spacing: 12) {
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
        
                HStack(spacing: 24) {
                    ForEach(actions, id: \.self) { action in
                        Button(action: {
                            commentText = action
                        }) {
                            HStack(spacing: 4) {
                                Text(action)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .padding(.top, 8)
                .padding(.horizontal)
            }

            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())

                TextField("댓글을 남기세요...", text: $commentText)
                    .padding(12)
                    .font(.system(size: 14))
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .onSubmit {
                        viewModel.uploadComments(comment: commentText)
                        commentText = ""
                    }
            }
            .padding(.top, 8)
            .padding(.bottom, 25)
            .padding(.horizontal)
            
        }
    }
}
