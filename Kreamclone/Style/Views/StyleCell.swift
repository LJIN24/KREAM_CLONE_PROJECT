//
//  StyleCell.swift
//  Kreamclone
//
//  Created by JIN on 6/25/25.
//

import SwiftUI
import Kingfisher

struct StyleCell: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: post.imageUrl.first ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 175)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color(.separator), lineWidth: 0.5)
                )
              
            HStack {
                if let ownerImageUrl = post.ownerImageUrl {
                    KFImage(URL(string: ownerImageUrl))
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                } else {
                    Image("defaultprofile")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                }
               
                Text(post.ownerUsername)
                    .font(.system(size: 13))
                    .fontWeight(.medium)
                Spacer()

            
            }.padding(.vertical, 4)
            
            Text(post.title)
                .font(.system(size: 13))
                .fontWeight(.light)
        }
        .frame(width: 175)
        .frame(maxHeight: 300)
        
    }
}

