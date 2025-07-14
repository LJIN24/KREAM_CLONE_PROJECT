//
//  CommentCell.swift
//  Kreamclone
//
//  Created by JIN on 7/1/25.
//

import SwiftUI
import Kingfisher

struct CommentsCell: View {
    let comment: Comment

    
    var body: some View {
        HStack {
            if let url = comment.commenterImageUrl{
                KFImage(URL(string: url))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            } else {
                Image("defaultprofile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            }
         
            Text("\(comment.username)")
                .fontWeight(.semibold)
                .font(.system(size: 14))
            +
            Text(" \(comment.comment)")
                .font(.system(size: 14))
            
            Spacer()
        }
    }
}
