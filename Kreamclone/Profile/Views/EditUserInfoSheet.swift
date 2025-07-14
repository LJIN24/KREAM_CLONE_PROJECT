//
//  EditUserInfoSheet.swift
//  Kreamclone
//
//  Created by JIN on 6/29/25.
//

import SwiftUI

struct EditUserInfoSheet: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var infoText: String
    let placeholder: String
    let sheetTitle: String
    
    let maxLength: Int = 25
    
    var body: some View {
        VStack {
            
            ZStack {
                Text("\(sheetTitle) 변경")
                    .fontWeight(.semibold)
                
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }.padding(.trailing)
                }
               
            }
            VStack {
                TextField("", text: $infoText, prompt: Text(placeholder))
                    .maxLength(text: $infoText, maxLength)
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.black)
                HStack {
                    Spacer()
                    Text("\(infoText.count)/\(maxLength)")
                        .foregroundStyle(.secondary)
                }
            }
       
            
            Spacer()
            
            Button {
              
                if sheetTitle == "이름" {
                    viewModel.updateUserName(name: infoText)
                 
                } else {
                    viewModel.updateUserIntro(intro: infoText)
                }
                dismiss()
            } label: {
                Text("저장하기")
                    .foregroundStyle(.white)
                    .frame(width: 320, height: 44)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

        }.padding()
    }
}

