//
//  EditProfileView.swift
//  Kreamclone
//
//  Created by JIN on 6/29/25.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel : ProfileViewModel
    @Binding var selectedTab: MainTab
    @State var username : String = ""
    @State var introduction: String = ""
    @State var showPopup: Bool = false
    @State private var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                
                ProfileEditImage(viewModel: viewModel, showPopup: $showPopup)
                
                VStack(alignment: .leading){
                    Text("프로필 정보")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .padding(.top)
                        .padding(.leading)
                    
                    EditUserName(viewModel: viewModel, username: $username, showPopup: $showPopup, title: "이름")
                    EditUserCaption(viewModel: viewModel, introduction: $introduction, showPopup: $showPopup, placeholder: "나를 소개하세요", title: "소개")
                    
                }
                
                HStack {
                    Text("로그아웃")
                        .foregroundStyle(.red)
                        .padding(.top, 20)
                        .onTapGesture {
                            showAlert = true
                        }
                        .alert("로그아웃 하시겠습니까?",
                               isPresented: $showAlert,
                               actions: {
                            Button("로그아웃", role: .destructive,
                                   action: {
                                viewModel.profileLogout()
                                selectedTab = .home
                            })
                            Button("취소", role: .cancel) { }
                        })
                    
                    Spacer()
                }.padding(.leading)
                
                if showPopup {
                    VStack {
                        Text("프로필 정보가 변경되었습니다 ✅")
                            .font(.system(size: 14))
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 300, height: 50)
               
                    }.padding()
                }
                
            }
        }.navigationTitle("프로필 관리")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: -2) {
                        Button {
                            dismiss()
                        } label: {
                            HStack {
                                Image("left")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                Spacer()
                            }
                            
                        }
                    }
                }
            }.onAppear {
                username = viewModel.user?.username ?? ""
                introduction = viewModel.user?.introduction ?? ""
        }
    }
}


