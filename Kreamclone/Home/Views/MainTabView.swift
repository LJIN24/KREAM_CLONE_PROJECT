//
//  MainTapView.swift
//  Kreamclone
//
//  Created by JIN on 6/12/25.
//

import SwiftUI

enum MainTab {
    case home
    case style
    case shop
    case saved
    case profile
}


struct MainTabView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedTab: MainTab = .home
    
    var body: some View {
        ZStack{
            
            switch selectedTab {
            case .home:
                NavigationStack{
                    HomeView(selectedTab: $selectedTab)
                }
            case .style:
                NavigationStack{
                    StyleView(selectedTab: $selectedTab)
                        .tint(.black)
                }
            case .shop:
                NavigationStack{
                    ShopView(selectedTab: $selectedTab)
                }.tint(.black)
            case .saved:
                NavigationStack{
                    SavedView(selectedTab: $selectedTab)
                }
            case .profile:
                NavigationStack{
                    ProfileView(selectedTab: $selectedTab)
                        .tint(.black)
                }
            }
        }
    }
}
