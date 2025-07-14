//
//  BottomSheet.swift
//  Kreamclone
//
//  Created by JIN on 6/26/25.
//


import SwiftUI


struct UploadSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isShowingBottomSheet: Bool
    @Binding var isShowingSelectImageScreen: Bool
    var body: some View {
        
        UploadButton(isShowingBottomSheet: $isShowingBottomSheet, isShowingSelectImageScreen: $isShowingSelectImageScreen)
            .padding(.vertical, 42)
            .transition(.move(edge: .bottom))
            .background(
                Color(uiColor: .white)
            )
            .cornerRadius(16, corners: [.topLeft, .topRight])
    }
}
