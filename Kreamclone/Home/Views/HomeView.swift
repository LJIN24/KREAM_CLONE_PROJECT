//
//  HomeView.swift
//  Kreamclone
//
//  Created by JIN on 6/23/25.
//

import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: MainTab
    @State var keyword: String = ""
    @State private var isSearchBarActive: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                SearchHeader(keyword: $keyword, isSearchBarActive: $isSearchBarActive, headerIcon: "notification", onHeaderIconTapped: nil)
                    .padding(.vertical)
                SlidingPageView()
                
                RecomendedKeywordList(keyword: $keyword)
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .overlay(alignment: .bottom) {
               CustomTabBar(selectedTab: $selectedTab)
                   .ignoresSafeArea(.keyboard, edges: .bottom)
           }
      
    }
}

