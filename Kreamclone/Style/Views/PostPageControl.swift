//
//  PostPageControl.swift
//  Kreamclone
//
//  Created by JIN on 7/1/25.
//

import SwiftUI

struct PostPageControl: View {
    let pageCount: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(0..<pageCount, id: \.self) { index in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(index == currentPage ? .black: .gray.opacity(0.2))
                    .animation(.easeIn(duration: 0.2), value: currentPage)
            }
        }
    }
    
}
