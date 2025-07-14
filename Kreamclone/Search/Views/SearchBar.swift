//
//  SearchBar.swift
//  Kreamclone
//
//  Created by JIN on 6/20/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var keyword: String
    let headerIcon: String?
    let onHeaderIconTapped: (() -> Void)?
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                TextField("", text: $keyword, prompt: Text("브랜드, 상품, 프로필, 태그 등").font(.system(size: 15)))
                    .padding()
            }
            .frame(width: 270, height: 40)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            
            if let headerIcon = headerIcon {
                Spacer()
                
                Button {
                    onHeaderIconTapped?()
                } label: {
                    Image(headerIcon)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Spacer()
                
                Image("shopping-bag")
                    .resizable()
                    .frame(width: 24, height: 24)
            } else {
                Image("shopping-bag")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.horizontal, 8)
            }
            
        }
    }
}
