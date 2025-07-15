//
//  ProfileEditImage.swift
//  Kreamclone
//
//  Created by JIN on 7/15/25.
//

import SwiftUI
import Kingfisher

struct ProfileEditImage: View {
    @ObservedObject var viewModel : ProfileViewModel
    @State var selectedImage: UIImage?
    @State private var imagePickerPresented = false
    var body: some View {
        if viewModel.user?.profileImageUrl == nil {
            
            Image("editprofile")
                .resizable()
                .profileEditImageModifier(viewModel: viewModel)
            
        }  else if let profileImageUrl = viewModel.user?.profileImageUrl {
            KFImage(URL(string: profileImageUrl))
                .resizable()
                .profileEditImageModifier(viewModel: viewModel)
        }
    }
}

