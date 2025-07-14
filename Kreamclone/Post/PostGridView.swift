//
//  PostGridView.swift
//  instagramclone2
//
//  Created by JIN on 5/5/25.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    private let colums = [GridItem(),GridItem(),GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    @StateObject var viewModel = PostGridViewModel()
    
    
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
            
            LazyVGrid(columns: colums, spacing: 2) {
                
                ForEach(viewModel.posts) { post in
                    
                    KFImage(URL(string: post.imageUrl.first ?? ""))
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width)
                            .clipped()
                    }

                 
                }
        }
      
        }
}
