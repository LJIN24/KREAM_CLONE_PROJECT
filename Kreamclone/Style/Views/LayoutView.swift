//
//  LayoutView.swift
//  Kreamclone
//
//  Created by JIN on 6/25/25.
//

import SwiftUI


struct LayoutView: View {
    @ObservedObject var viewModel: StyleViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating:GridItem(), count: 2),content: {
                VStack(spacing: 12) {
                    createGrid(for: viewModel.posts.filter{!isHeavy($0)})
                    Spacer()
                }
                
                VStack(spacing: 12) {
                    createGrid(for: viewModel.posts.filter{isHeavy($0)})
                    Spacer()
                }
            })
        }
    }
    
    func createGrid(for filteredPost: [Post]) -> some View {
        ForEach(filteredPost) { post in
            GridRow {
                NavigationLink {
                    StyleDetailView(post: post)
                       
                } label: {
                    StyleCell(post: post)
                }
            }
        }
    }
    
    func isHeavy(_ post: Post) -> Bool {
        if let index = viewModel.posts.firstIndex(where: { $0.id == post.id }) {
            return index % 2 == 1
        }
            return false
    }
}

