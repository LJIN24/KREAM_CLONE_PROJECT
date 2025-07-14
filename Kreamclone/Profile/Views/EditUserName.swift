//
//  EditTextField.swift
//  Kreamclone
//
//  Created by JIN on 6/29/25.
//

import SwiftUI

struct EditUserName: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State var isEditing = false
    @Binding var username: String
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            HStack {
                Text(username)
                Spacer()
                Button {
                    isEditing = true
                } label: {
                    Text("변경")
                        .font(.system(size: 14))
                        .frame(width: 40, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke())
                }.tint(Color.black)
                    .sheet(isPresented: $isEditing) {
                        EditUserInfoSheet(viewModel: viewModel, infoText: $username, placeholder: "이름을 입력하세요...", sheetTitle: title)
                    }

            }
            Divider()
        }.padding()
    }
}
