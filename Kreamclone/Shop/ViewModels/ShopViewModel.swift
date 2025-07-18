//
//  ShopViewModel.swift
//  Kreamclone
//
//  Created by JIN on 6/19/25.
//

import Foundation
import FirebaseCore

class ShopViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var searchProducts: [Product] = []
    
    init () {
        fetchProducts()
    }
    
    func fetchProducts() {
        productRef.getDocuments() { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.products = documents.compactMap({ try? $0.data(as: Product.self)})
        }
    }
    
    func getFillteredProducts(by category: String) {
        productRef.getDocuments() { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            if category == "전체" {
                self.products = documents.compactMap({ try? $0.data(as: Product.self)})
            } else {
                self.products = documents.compactMap({ try? $0.data(as: Product.self)}).filter({ $0.category == category || $0.subCategory == category })
            }
        }
    }
    
    func getSearchProducts(by query: String) {
        productRef.getDocuments() { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.searchProducts = documents.compactMap({ try? $0.data(as: Product.self)}).filter {
                $0.brandName.localizedCaseInsensitiveContains(query) ||
                $0.title.localizedCaseInsensitiveContains(query) ||
                $0.englishTitle.localizedCaseInsensitiveContains(query) ||
                $0.subCategory?.localizedCaseInsensitiveContains(query) ?? false
            }
        }
    }
}


  
