//
//  ProfileEditImageModifier.swift
//  Kreamclone
//
//  Created by JIN on 7/15/25.
//

import SwiftUI

struct ProfileEditImageModifier: ViewModifier {
    @ObservedObject var viewModel : ProfileViewModel
    @State var selectedImage: UIImage?
    @State private var imagePickerPresented = false
 
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 80, height: 80)
            .overlay {
                Rectangle()
                    .fill(Color.black.opacity(0.6))
                    .frame(height: 25)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .overlay {
                Text("편집")
                    .font(.caption)
                    .foregroundColor(.white)
                    .bold()
                    .offset(y: 25)
            }
            .clipShape(Circle())
            .onTapGesture {
                imagePickerPresented.toggle()
                }.sheet(isPresented: $imagePickerPresented) {
                ImagePicker(image: $selectedImage)
            }.onChange(of: selectedImage) { _, newValue in
                viewModel.updateProfileImage(image: selectedImage , type: .profile)
            }
    }
}


extension View {
    func profileEditImageModifier(viewModel: ProfileViewModel) -> some View {
        return ModifiedContent(content: self, modifier: ProfileEditImageModifier(viewModel: viewModel))
    }
}
