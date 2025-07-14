//
//  ShopHeaderView.swift
//  Kreamclone
//
//  Created by JIN on 6/12/25.
//

import SwiftUI

struct ShopHeaderView: View {
    
    @State private var selectedTab = "전체"
    @Binding var searchKeyword: String
    @State private var isSearchBarActive: Bool = false
    @ObservedObject var viewModel: ShopViewModel
    let tabs = ["전체", "럭셔리", "신발", "상의", "아우터", "하의", "가방", "지갑"]

    
    var body: some View {
        
        VStack {
            SearchHeader(keyword: $searchKeyword, isSearchBarActive: $isSearchBarActive, headerIcon: "menu", onHeaderIconTapped: nil)
         
           }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack(spacing: 4) {
                            Text(tab)
                                .font(.system(size:15, weight: tab == selectedTab ? .bold : .regular))
                                .padding(.horizontal, 4)
                            
                                Color.clear.frame(height: 1)
                            
                        }.onTapGesture {
                            viewModel.getFillteredProducts(by: tab)
                            selectedTab = tab
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 8)
            Divider()
        }
    }

