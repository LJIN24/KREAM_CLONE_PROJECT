//
//  EditUserCaption.swift
//  Kreamclone
//
//  Created by JIN on 6/29/25.
//

import SwiftUI

struct EditUserCaption: View {
    @ObservedObject var viewModel : ProfileViewModel
    @State var isEditing = false
    @Binding var introduction: String
    let placeholder: String?
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            HStack {
                ZStack {
                    if introduction.isEmpty {
                        if let placeholder = placeholder {
                            Text(placeholder)
                                .foregroundColor(.gray)
                        }
                    }else {
                        Text(introduction)
                    }
                }
               
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
                        EditUserInfoSheet(viewModel: viewModel, infoText: $introduction, placeholder: "소개를 입력하세요...", sheetTitle: title)
                    }

            }
            Divider()
        }.padding()
    }
}


