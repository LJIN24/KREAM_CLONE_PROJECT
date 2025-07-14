//
//  OnlineBottomSheet.swift
//  Kreamclone
//
//  Created by JIN on 6/26/25.
//

import SwiftUI
import Photos

struct UploadButton: View{
    @State var isPresented: Bool = false
    @Binding var isShowingBottomSheet: Bool
    @Binding var isShowingSelectImageScreen: Bool
    
    let buttonHeight: CGFloat = 55
    
    var body: some View{
        VStack(alignment: .leading) {
            
            ZStack {
                Text("스타일 올리기")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                HStack {
                    Spacer()
                    Image("xicon")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }.padding()
          
            
            Button {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    isShowingBottomSheet = false
                    isShowingSelectImageScreen = true
                }
         
               } label: {
                HStack(spacing: 10) {
                    Image("photoicon")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .fontWeight(.light)
                    Text("사진")
                        
                }
                
            }.tint(.black)
        }
        .padding(.horizontal, 16)
    }
}

