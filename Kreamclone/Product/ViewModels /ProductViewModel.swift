//
//  ProductSaveButtonViewModel.swift
//  Kreamclone
//
//  Created by JIN on 7/12/25.
//

import Foundation

class ProductViewModel:ObservableObject {
    @Published var product: Product
    
    init(product: Product) {
        self.product = product
        checkIfProductSaved()
    }
    
    func saved() {
        guard let currentUid = AuthViewModel.shared.currentUser?.uid else { return }
        guard let productId = self.product.id else { return }
        
        productRef.document(productId).collection("product-saved").document(currentUid).setData([:]) { _ in
            
            productRef.document(productId).getDocument { snapshot, _ in
            self.product.isSaved = true
                
            guard let product = try? snapshot?.data(as: Product.self) else { return }
                
                let savedProduct: [String: Any] = [
                    "id": productId,
                    "price": product.price,
                    "brandName": product.brandName,
                    "title": product.title,
                    "englishTitle": product.englishTitle,
                    "imageUrl": product.imageUrl,
                    "category": product.category,
                    "size": product.size
                ]
                userRef.document(currentUid).collection("saved-products").document(productId).setData(savedProduct)
            }
        }
        print("저장")
    }
    
    func unsaved() {
        guard let currentUid = AuthViewModel.shared.currentUser?.uid else { return }
        guard let productId = self.product.id else { return }
        
        productRef.document(productId).collection("product-saved").document(currentUid).delete()
        userRef.document(currentUid).collection("saved-products").document(productId).delete()
        
        self.product.isSaved = false
    }
    
    func checkIfProductSaved() {
        guard let currentUid = AuthViewModel.shared.currentUser?.uid else { return }
        guard let productId = self.product.id else { return }
        productRef.document(productId).collection("product-saved").document(currentUid).getDocument() { snapshot ,_ in
            guard let isSaved = snapshot?.exists else { return }
            self.product.isSaved = isSaved
        }
    }
}

