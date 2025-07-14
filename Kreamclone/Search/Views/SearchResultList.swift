//
//  SearchResultList.swift
//  Kreamclone
//
//  Created by JIN on 6/24/25.
//

import SwiftUI

struct SearchResultList: View {
    let products: [Product]
    private let colums = [GridItem(),GridItem()]
    
    var body: some View {
        LazyVGrid(columns: colums, spacing: 20) {
            ForEach(products) { product in
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    ProductCardView(product: product)
                }.buttonStyle(.plain)
            }
            
        }.padding(.horizontal)
    }
}

