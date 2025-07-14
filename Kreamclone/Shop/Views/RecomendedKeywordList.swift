//
//  CategoryView.swift
//  Kreamclone
//
//  Created by JIN on 6/6/25.
//

import SwiftUI

struct RecomendedKeywordList: View {
    @Binding var keyword: String
    @StateObject var viewModel = SearchViewModel()
    @State private var isSearchBarActive: Bool = false
    
    struct RecommendedKeyword: Identifiable {
        let id = UUID()
        let imageName: String
        let keyword: String
    }
    
    let recommendedKeywords: [RecommendedKeyword] = [
        
        RecommendedKeyword(imageName: "tshirt", keyword: "티셔츠"),
        RecommendedKeyword(imageName: "nike", keyword: "나이키"),
        RecommendedKeyword(imageName: "supreme", keyword: "슈프림"),
        RecommendedKeyword(imageName: "cap", keyword: "볼캡"),
        RecommendedKeyword(imageName: "newbalance", keyword: "뉴발란스"),
        RecommendedKeyword(imageName: "backpack", keyword: "백팩"),
        RecommendedKeyword(imageName: "hunter", keyword: "헌터"),
        RecommendedKeyword(imageName: "running", keyword: "러닝화"),
        RecommendedKeyword(imageName: "nintendo", keyword: "닌텐도"),
        RecommendedKeyword(imageName: "cardcase", keyword: "카드지갑"),
    ]
    
    private let rows = [GridItem(),GridItem()]
    
    var body: some View {
        HStack {
            LazyHGrid(rows: rows) {
                ForEach(recommendedKeywords) { item in
                    VStack(spacing: 4) {
                        Image(item.imageName)
                            .resizable()
                            .frame(width:60 , height: 60)
                            .padding(.horizontal, 4)
                        Text(item.keyword)
                            .font(.caption)
                            .fontWeight(.light)
                    }
                    .onTapGesture {
                        viewModel.getSearchProducts(by: item.keyword)
                        keyword = item.keyword
                        isSearchBarActive = true
                    }
                   
                }
            }.navigationDestination(isPresented: $isSearchBarActive, destination: {
                SearchResultView(keyword: $keyword, viewModel: viewModel)
            })
        }.frame(height: 200)
      
    }
}

