//
//  SignupView.swift
//  Kreamclone
//
//  Created by JIN on 6/18/25.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @FocusState var isFoucused: Bool
    @ObservedObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            
            CustomTextField(text: $email, isFocused: $isFoucused)
                .padding(.vertical)
            CustomSecureField(password: $password)
            
            Button {
                viewModel.signUp(email: email, password: password)
                dismiss()
            } label: {
                Text("가입하기")
                    .frame(width: 360, height: 50)
                    .background(Color.black)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
            }
            Spacer()
        }.navigationTitle("회원가입")
         .navigationBarTitleDisplayMode(.large)
    }
}

