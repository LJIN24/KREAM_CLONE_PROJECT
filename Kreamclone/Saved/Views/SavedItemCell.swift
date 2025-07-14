//
//  SavedItemCell.swift
//  Kreamclone
//
//  Created by JIN on 6/19/25.
//

import SwiftUI
import Kingfisher

struct SavedItemCell: View {
    let savedItem: Product
    var body: some View {
        HStack {
            VStack {
                KFImage(URL(string: savedItem.imageUrl))
                    .resizable()
                    .frame(width: 60, height: 60)
            }.frame(width: 100, height: 100)
                .background(Color.gray.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(savedItem.brandName)
                    .font(.system(size: 12, weight: .bold, design: .default))
                Text(savedItem.englishTitle)
                    .font(.system(size: 12, weight: .light, design: .default))
                Spacer()
            }
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                ProductSaveButton(product: savedItem, width: 24, height: 22)
                Spacer()
                Text("즉시 구매가")
                    .font(.system(size: 12, weight: .light, design: .default))
                    .foregroundStyle(.secondary)
                Text("\(savedItem.price)")
                    .font(.system(size: 12, weight: .bold, design: .default))
            }
            
        }
         .frame(maxWidth: .infinity)
         .frame(height: 100)
    }
}

