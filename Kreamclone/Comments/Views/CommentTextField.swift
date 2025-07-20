//
//  CommentTextField.swift
//  Kreamclone
//
//  Created by JIN on 7/20/25.
//

import SwiftUI

struct CommentTextField: View {
    @Binding var text: String
    var onSubmit: (String) -> Void
    var body: some View {
        RepresentableTextField(text: $text, placeHolderString: "댓글을 입력하세요...", onSubmit: onSubmit)
            .frame(height: 15)
            .padding(12)
            .font(.system(size: 14))
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

