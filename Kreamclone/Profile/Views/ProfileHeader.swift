//
//  ProfileHeader.swift
//  Kreamclone
//
//  Created by JIN on 6/29/25.
//

import SwiftUI
import Kingfisher

struct ProfileHeader: View {
    @Binding var selectedTab: MainTab
    @ObservedObject var viewModel: ProfileViewModel
    var userName: String {
        viewModel.user?.username ?? ""
    }
    var body: some View {
        HStack {
            if let profileImageUrl = viewModel.user?.profileImageUrl {
                KFImage(URL(string: profileImageUrl))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
            } else {
                Image("defaultprofile")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            }
           
            VStack(alignment: .leading) {
                Text(userName)
                HStack {
                    HStack {
                        Text("팔로워")
                       
                        Text("0")
                            .fontWeight(.bold)
                    }
                    Divider()
                        .frame(height: 15)
                    HStack {
                        Text("팔로잉")
                    
                        Text("0")
                            .fontWeight(.bold)
                    }
                }
              
            }
            Spacer()
            
        }
        HStack{
            Text(viewModel.user?.introduction ?? "")
            Spacer()
        }
       
        
        HStack {
            NavigationLink {
                EditProfileView(viewModel: viewModel, selectedTab: $selectedTab)
            } label: {
                Text("프로필 관리")
                    .font(.system(size: 13))
                    .frame(width: 175, height: 25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
            }
            Spacer()
        }.padding(.top)

    }
}
