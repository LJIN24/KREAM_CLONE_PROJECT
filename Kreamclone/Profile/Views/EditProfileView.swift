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
    @State var selectedImage: UIImage?
    @State private var imagePickerPresented = false
    
    var body: some View {
        ScrollView {
            VStack {
                if viewModel.user?.profileImageUrl == nil {
                    
                    Image("editprofile")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.top, 20)
                        .onTapGesture {
                            imagePickerPresented.toggle()
                            }.sheet(isPresented: $imagePickerPresented) {
                            ImagePicker(image: $selectedImage)
                        }.onChange(of: selectedImage) { _, newValue in
                            viewModel.updateProfileImage(image: selectedImage , type: .profile)
                        }

                }  else if let profileImageUrl = viewModel.user?.profileImageUrl {
                    KFImage(URL(string: profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.top, 20)
                    .onTapGesture {
                        imagePickerPresented.toggle()
                        }.sheet(isPresented: $imagePickerPresented) {
                        ImagePicker(image: $selectedImage)
                    }.onChange(of: selectedImage) { _, newValue in
                        viewModel.updateProfileImage(image: selectedImage , type: .profile)
                    }
            }
                
                VStack(alignment: .leading){
                    Text("프로필 정보")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .padding(.top)
                        .padding(.leading)
                    
                    EditUserName(viewModel: viewModel, username: $username, title: "이름")
                    EditUserCaption(viewModel: viewModel, introduction: $introduction, placeholder: "나를 소개하세요", title: "소개")
                    
                }
                
                HStack {
                    Button {
                        viewModel.profileLogout()
                        selectedTab = .home
                    } label: {
                        Text("로그아웃")
                            .foregroundStyle(.red)
                            .padding(.top, 20)
                   }
                    Spacer()
                }.padding(.leading)
             
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

