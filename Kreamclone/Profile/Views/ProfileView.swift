//
//  ProfileView.swift
//  Kreamclone
//
//  Created by JIN on 6/18/25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var selectedTab: MainTab
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeader(selectedTab: $selectedTab, viewModel: viewModel)
                    .padding(.leading)
                    .padding(.bottom)
                Rectangle()
                    .frame(height: 5)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.gray.opacity(0.2))
                      
                            
                PostGridView()
                    .padding(.top)
            }
        }
        .navigationTitle("내 프로필")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

