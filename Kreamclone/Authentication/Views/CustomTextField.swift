//
//  CustomTextField.swift
//  Kreamclone
//
//  Created by JIN on 6/14/25.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("이메일 주소")
                .font(.system(size: 14, weight: .semibold))
            TextField("", text: $text, prompt: Text(verbatim: "예) kream@kream.co.kr").font(.system(size: 14)))
                .focused($isFocused)
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
            
        }.padding(.horizontal)
    }
}

