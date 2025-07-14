//
//  RandomString.swift
//  Kreamclone
//
//  Created by JIN on 6/18/25.
//

import Foundation


func generateRandomUsername(length: Int = 6) -> String {
let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
return String((0..<length).compactMap { _ in letters.randomElement() })
}
