//
//  ProductDetailView.swift
//  Kreamclone
//
//  Created by JIN on 6/7/25.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ZStack {
                    Color.gray.opacity(0.2)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                        .clipped()
                    
                    KFImage(URL(string: product.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                        .clipped()
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("즉시 구매가")
                        .font(.system(size: 15, weight: .light))
                    Text("\(product.price)")
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.top)
                .padding(.leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.englishTitle)
                        .font(.system(size: 17, weight: .light))
                    Text(product.title)
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                }
                .padding(.top)
                .padding(.leading)
          
                
                Spacer()
             
                
            }.navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                Image("left")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                            }.offset(x: -10)
                        }
                }
            }

        }.safeAreaInset(edge: .bottom) {
            bottomButtonView(product: product)
        }
    }
}


