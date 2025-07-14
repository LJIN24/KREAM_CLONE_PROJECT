//
//  ShopView.swift
//  Kreamclone
//
//  Created by JIN on 6/5/25.
//

import SwiftUI

struct ShopView: View {
    @Binding var selectedTab: MainTab
    @State private var searchKeyword: String = ""
    @StateObject var viewModel = ShopViewModel()
    
    private let colums = [GridItem(),GridItem()]
    
    var body: some View {
        VStack {
            
            ShopHeaderView(searchKeyword: $searchKeyword, viewModel: viewModel)
            
            ScrollView {
                
                VStack {
                    
                    RecomendedKeywordList(keyword: $searchKeyword)
                    
                    ShopItemtList(viewModel: viewModel)
                   
                }
            }
        }.safeAreaInset(edge: .bottom) {
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}
