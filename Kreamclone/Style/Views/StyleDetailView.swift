//
//  StyleDetailView.swift
//  Kreamclone
//
//  Created by JIN on 6/25/25.
//

import SwiftUI
import Kingfisher

struct StyleDetailView: View {
    @StateObject var viewModel : StyleDetailViewModel
    @StateObject var commentViewModel: CommentViewModel
    @Environment(\.dismiss) var dismiss
    @State var currentIndex: Int = 0
    let post: Post
    
    init(post: Post) {
        self.post = post
        self._viewModel = StateObject(wrappedValue: StyleDetailViewModel(post: post))
        self._commentViewModel = StateObject(wrappedValue: CommentViewModel(post: post))
    }
    
    var didLike:Bool {
        return viewModel.post.didLiked ?? false
    }
    
    var likes: String { return "\(viewModel.post.likes)"}
    
    var timestampString: String {
        let date = post.timestamp.dateValue()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yy년 M월 d일"
        return formatter.string(from: date)
    }

    var body: some View {
        ScrollView {
            
            VStack {
                HStack {
                    KFImage(URL(string: post.ownerImageUrl ?? ""))
                        .resizable()
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4) {
                        Text(post.ownerUsername)
                            .fontWeight(.semibold)
                        Text("\(timestampString)")
                            .foregroundStyle(.secondary)
                    }.font(.caption)
                    
                    Spacer()
                    
                }.padding(.leading)
                TabView(selection: $currentIndex){
                    ForEach(0..<post.imageUrl.count, id: \.self) { index in
                        KFImage(URL(string: post.imageUrl[index]))
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 500)
                            .scaledToFill()
                            .clipped()
                            .tag(index)
                    }
                }
                .frame(height: 500)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                PostPageControl(pageCount: post.imageUrl.count, currentPage: $currentIndex)
                
                HStack(spacing: 20) {
                    
                    Text(post.caption)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .padding(.leading, 8)
                    
                    Spacer()
                    Button(action: {
                        didLike ? viewModel.unlike() : viewModel.like()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: didLike ? "heart.fill" : "heart")
                                .foregroundStyle(didLike ? Color(#colorLiteral(red: 1, green: 0, blue: 0.5987907052, alpha: 1)) : .black)
                                .font(.system(size: 24))
                            Text("\(likes)")
                        }
                    }
                    
                    
                }
                .foregroundStyle(.black)
                .padding(.horizontal, 6)
            
                Divider()
                
                CommentsView(viewModel: commentViewModel)
                
            }.padding(.top)
            
        }.safeAreaInset(edge: .bottom) {
            CommentBarView(viewModel: commentViewModel)
                .background(Color.white)
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle("게시물")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image("left")
                                .resizable()
                                .frame(width: 45, height: 45)
                            Spacer()
                        }
                        
                    }
                }
            }
        }
    }
}
