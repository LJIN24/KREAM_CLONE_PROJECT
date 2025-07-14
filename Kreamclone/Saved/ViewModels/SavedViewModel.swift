//
//  SavedViewModel.swift
//  Kreamclone
//
//  Created by JIN on 6/29/25.
//

import Foundation

class SavedViewModel:ObservableObject {
    @Published var savedList:[Product] = []
    
    init() {
        fetchSavedList()
    }
    
    func fetchSavedList(){
        guard let uid = AuthViewModel.shared.currentUser?.uid else { return }
        userRef.document(uid).collection("saved-products").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.savedList = documents.compactMap({try? $0.data(as : Product.self)})
        }
    }
}
