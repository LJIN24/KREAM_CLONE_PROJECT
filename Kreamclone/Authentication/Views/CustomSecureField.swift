//
//  CustomSecureField.swift
//  Kreamclone
//
//  Created by JIN on 6/14/25.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var password: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("비밀번호")
                .font(.system(size: 14, weight: .semibold))
            SecureField("", text: $password)
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
            
        }.padding(.horizontal)
    }
}

