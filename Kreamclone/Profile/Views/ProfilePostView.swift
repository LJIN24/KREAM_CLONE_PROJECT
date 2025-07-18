//
//  PostGridView.swift
//  instagramclone2
//
//  Created by JIN on 5/5/25.
//

import SwiftUI
import Kingfisher

struct ProfilePostView: View {
    
    private let colums = [GridItem(),GridItem()]
    @StateObject var viewModel = ProfilePostViewModel()
    
    
    var body: some View {
        VStack {
            VStack {
                Text("\(viewModel.posts.count)")
                    .fontWeight(.bold)
                Text("게시물")
                    .font(.caption)
                    .foregroundStyle(.gray.opacity(0.5))
            }
            
            Divider()
            
            LazyVGrid(columns: colums, spacing: 15) {
                
                ForEach(viewModel.posts) { post in
                    VStack(alignment: .leading) {
                            KFImage(URL(string: post.imageUrl.first ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 175, height: 175)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                }
            }
            .padding(.top, 8)
            .padding(.horizontal)
            
        }
    }
}
