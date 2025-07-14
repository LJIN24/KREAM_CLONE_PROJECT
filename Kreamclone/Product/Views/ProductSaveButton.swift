//
//  ProductSaveButton.swift
//  Kreamclone
//
//  Created by JIN on 7/12/25.
//

import SwiftUI

struct ProductSaveButton: View {
    let width: CGFloat
    let height: CGFloat
    
    @StateObject var viewModel: ProductViewModel
    
    init(product:Product, width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        self._viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
    }
    
    var isSaved: Bool {
        viewModel.product.isSaved ?? false
    }
    var body: some View {
        Button(action: {
            isSaved ? viewModel.unsaved() : viewModel.saved()
                 }) {
                     Image(isSaved ? "bookmark.fill" : "bookmark")
                         .resizable()
                         .frame(width: width, height: height)
        }
    }
}
