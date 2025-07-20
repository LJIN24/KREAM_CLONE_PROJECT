//
//  CommentsView.swift
//  Kreamclone
//
//  Created by JIN on 7/1/25.
//

import SwiftUI

struct CommentsView: View {
   @ObservedObject var viewModel: CommentViewModel
    
    var body: some View {
            VStack {
                ForEach(viewModel.comments) { comment in
                    CommentsCell(comment: comment)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
        }
    }
}
