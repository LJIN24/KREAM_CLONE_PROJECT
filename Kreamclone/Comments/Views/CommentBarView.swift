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
    @FocusState private var isFocused: Bool
    
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
                CommentTextField(text: $commentText) { comment in
                    viewModel.uploadComments(comment: comment)
                }
                   
                 
            }
            .padding(.top, 8)
            .padding(.bottom, 25)
            .padding(.horizontal)
            
        }
    }
}
