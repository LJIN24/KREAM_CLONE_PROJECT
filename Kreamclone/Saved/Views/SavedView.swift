//
//  SavedView.swift
//  Kreamclone
//
//  Created by JIN on 6/6/25.
//

import SwiftUI

struct SavedView: View {
    @StateObject var vieModel = SavedViewModel()
    @Binding var selectedTab: MainTab
    var body: some View {
        
        ScrollView {
            VStack {
                
                ForEach(vieModel.savedList) { item in
                    SavedItemCell(savedItem: item)
                        .padding()
                    Divider()
                       
                }
                
            }
        }.navigationTitle("Saved")
         .navigationBarTitleDisplayMode(.large)
         .safeAreaInset(edge: .bottom) {
             CustomTabBar(selectedTab: $selectedTab)
             
         }
      
    }
}
