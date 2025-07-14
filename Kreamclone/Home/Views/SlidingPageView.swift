//
//  SlidingPageView.swift
//  Kreamclone
//
//  Created by JIN on 6/23/25.
//

import SwiftUI



struct SlidingPageView: View {
    @State private var currentPage = 0
    private let bannerImages: [Image] = [Image("banner1"),
                                         Image("banner2"),
                                         Image("banner3"),
                                         Image("banner4"),
                                         Image("banner5"),
                                         Image("banner6"),
                                         Image("banner7"),
                                         Image("banner8")]
    
    var body: some View {
        
        ZStack{
            TabView(selection: $currentPage) {
                ForEach(0..<bannerImages.count, id: \.self) { index in
                    bannerImages[index]
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .scaledToFill()
                        .clipped()
                        .tag(index)
                }
            }
            .frame(height: 300)
            .tabViewStyle(.page(indexDisplayMode: .never))

            SlidingBarPageControl(pageCount: bannerImages.count, currentPage: $currentPage)
                .padding(.horizontal, 8)
                .padding(.top, 8)
                .offset(y:140)
        }
    }
}

#Preview {
    SlidingPageView()
}
