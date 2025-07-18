//
//  StyleView.swift
//  Kreamclone
//
//  Created by JIN on 6/25/25.
//

import SwiftUI

struct StyleView: View {
    @Binding var selectedTab: MainTab
    @State var keyword: String = ""
    @State var isShowingSelectImageScreen: Bool = false
    @State var isSearchBarActive: Bool = false
    @State var isShowingBottomSheet = false
    @StateObject var viewModel = StyleViewModel()
       var body: some View {
           ScrollView {
               VStack {
                   SearchBar(keyword: $keyword, headerIcon: "camera") {
                       isShowingBottomSheet = true
                   }.fullScreenCover(isPresented: $isShowingSelectImageScreen) {
                       SelectUploadImageView(isPresented: $isShowingSelectImageScreen)
                    }
                    .sheet(isPresented: $isShowingBottomSheet) {
                           UploadSheet(isShowingBottomSheet: $isShowingBottomSheet, isShowingSelectImageScreen: $isShowingSelectImageScreen)
                               .presentationDetents([.fraction(0.15)])
                    }

                   LayoutView(viewModel: viewModel)
                       .padding(.top, 10)
               }.padding(.horizontal)
           }
           .refreshable {
               viewModel.fetchPosts()
           }
           .scrollDismissesKeyboard(.interactively)
           .overlay(alignment: .bottom) {
               CustomTabBar(selectedTab: $selectedTab)
                   .ignoresSafeArea(.keyboard, edges: .bottom)
           }
    }
}
