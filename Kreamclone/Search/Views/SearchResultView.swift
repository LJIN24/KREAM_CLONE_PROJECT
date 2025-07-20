//
//  SearchResultView.swift
//  Kreamclone
//
//  Created by JIN on 6/24/25.
//

import SwiftUI

struct SearchResultView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var keyword: String
    @ObservedObject var viewModel: SearchViewModel
    var body: some View {
        ScrollView {
            VStack {
                SearchResultList(products:  viewModel.searchProducts)
                Spacer()
            }
            .padding(.top)
            .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack(spacing: -2) {
                            Button {
                                dismiss()
                                keyword = ""
                            } label: {
                                Image("left")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                            }
                            SearchBar(keyword: $keyword, headerIcon: nil, onHeaderIconTapped: nil)
                    }
                }
            }
        }
       
    }
}

