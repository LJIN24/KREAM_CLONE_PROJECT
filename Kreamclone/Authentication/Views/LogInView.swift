//
//  LogInView.swift
//  Kreamclone
//
//  Created by JIN on 6/14/25.
//

import SwiftUI

struct LogInView: View {
    @FocusState var isFoucused: Bool
    @State var email: String = ""
    @State var password: String = ""
    @Binding var showSignUp: Bool
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showSignUp = false
                    } label: {
                        Image("xicon")
                            .resizable()
                            .frame(width:25, height: 25)
                            .scaledToFill()
                    }
                }.padding()
                
                Spacer()
                
                Image("kreamlogo")
                    .resizable()
                    .frame(width:250, height: 60)
                    .scaledToFill()
                    .padding(.bottom, 30)
       

                CustomTextField(text: $email, isFocused: $isFoucused)
                    .padding(.vertical)
                CustomSecureField(password: $password)

                Button {
                    viewModel.signIn(email: email, password: password)
                    showSignUp = false
                } label: {
                    Text("로그인")
                        .frame(width: 360, height: 50)
                        .background(Color.black)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding()
                }
                NavigationLink {
                    SignUpView(viewModel: viewModel)
                } label: {
                    Text("이메일 가입")
                    .font(.system(size:13, weight: .light))
                }

             
                
                Button {
                    viewModel.naverLogin()
                    showSignUp = false
                } label: {
                    ZStack {
                        HStack {
                            Image("네이버로고")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Spacer()
                        }
                   
                        Text("네이버로 로그인")
                    }.fontWeight(.semibold)
                        .frame(width: 360, height: 50)
                        .foregroundStyle(.black)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                        .padding()
                }
                
                Spacer()
            }.tint(.black)
        }.scrollDismissesKeyboard(.interactively)
    }
}

