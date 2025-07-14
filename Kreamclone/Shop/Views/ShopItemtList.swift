//
//  ProductList.swift
//  Kreamclone
//
//  Created by JIN on 6/21/25.
//

import SwiftUI

struct ShopItemtList: View {
    private let colums = [GridItem(),GridItem()]
    @ObservedObject var viewModel: ShopViewModel
    var body: some View {
        
        LazyVGrid(columns: colums, spacing: 20) {
            ForEach(viewModel.products) { product in
                NavigationLink {
                    ProductDetailView(product: product)
                    
                } label: {
                    ProductCardView(product: product)
                }.buttonStyle(.plain)
            }
            
        }.padding(.horizontal)
    }
}
