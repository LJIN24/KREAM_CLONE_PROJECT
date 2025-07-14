//
//  String.swift
//  Kreamclone
//
//  Created by JIN on 6/5/25.
//


import Foundation

extension String {
    func splitChar() -> String {
        return self.split(separator: "").joined(separator: "\u{200B}")
    }
}

