//
//  TextArea.swift
//  Kreamclone
//
//  Created by JIN on 7/1/25.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var captionText: String
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            if captionText.isEmpty {
                
                Text("아이템과 스타일을 자랑해보세요...")
                    .font(.caption)
                    .padding(.top, 8)
                    .foregroundStyle(.gray.opacity(0.3))
            }
            
            TextEditor(text: $captionText)
                .background(Color.clear)
                .padding(.leading, -5)
                .scrollContentBackground(.hidden)
      
        }
        .frame(height: 200)
    }
}

