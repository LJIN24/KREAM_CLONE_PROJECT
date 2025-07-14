//
//  SearchHeader.swift
//  Kreamclone
//
//  Created by JIN on 6/25/25.
//

import SwiftUI

struct SearchHeader: View {
    @Binding var keyword: String
    @Binding var isSearchBarActive: Bool
    @StateObject var viewModel = SearchViewModel()
    let headerIcon: String
    let onHeaderIconTapped: (() -> Void)?
    
    var body: some View {
        VStack {
            SearchBar(keyword: $keyword, headerIcon: headerIcon, onHeaderIconTapped: onHeaderIconTapped)
                .padding(.horizontal)
                .navigationDestination(isPresented: $isSearchBarActive, destination: {
                    SearchResultView(keyword: $keyword, viewModel: viewModel)
                })
                .onSubmit {
                    isSearchBarActive = true
                    viewModel.getSearchProducts(by: keyword)
                }
        }
    }
    
}
