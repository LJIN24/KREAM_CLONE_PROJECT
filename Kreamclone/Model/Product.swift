//
//  Product.swift
//  Kreamclone
//
//  Created by JIN on 6/18/25.
//

import Foundation
import FirebaseFirestore

struct Product: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let imageUrl: String
    let price:Int
    let brandName: String
    let englishTitle:String
    let title:String
    let category: String
    let subCategory: String?
    let size: [String]
    
    var isSaved: Bool? = false
}
