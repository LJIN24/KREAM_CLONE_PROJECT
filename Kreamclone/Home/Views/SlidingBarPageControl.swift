//
//  SlidingPageContro.swift
//  Kreamclone
//
//  Created by JIN on 7/1/25.
//

import SwiftUI
struct SlidingBarPageControl: View {
    let pageCount: Int
    @Binding var currentPage: Int

    var body: some View {
        GeometryReader { proxy in
            let totalWidth = proxy.size.width
            let segmentWidth = totalWidth / CGFloat(pageCount)

            ZStack(alignment: .leading) {
                // 배경 트랙
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1.5)

                // 현재 페이지 인디케이터
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(Color.black)
                    .frame(width: segmentWidth, height: 1.5)
                    .offset(x: CGFloat(currentPage) * segmentWidth)
                    .animation(.easeInOut, value: currentPage)
            }
        }
        .frame(height: 1.5)
    }
}
