//
//  SearchViewModel.swift
//  Kreamclone
//
//  Created by JIN on 6/24/25.
//

import Foundation

class SearchViewModel:ObservableObject {
    
    @Published var searchProducts: [Product] = []
    
    
    func getSearchProducts(by query: String) {
        productRef.getDocuments() { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.searchProducts = documents.compactMap({ try? $0.data(as: Product.self)}).filter {
                $0.brandName.localizedCaseInsensitiveContains(query) ||
                $0.title.localizedCaseInsensitiveContains(query) ||
                $0.englishTitle.localizedCaseInsensitiveContains(query) }
            print(self.searchProducts)
        }
        
    }
}
