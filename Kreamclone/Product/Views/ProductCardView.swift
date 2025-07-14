//
//  ProductCardView.swift
//  Kreamclone
//
//  Created by JIN on 6/5/25.
//

import SwiftUI
import Kingfisher

struct ProductCardView: View {

    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                VStack {
                    KFImage(URL(string: product.imageUrl))
                        .resizable()
                        .frame(width: 150, height: 150)
                }.frame(width: 180, height: 180)
                    .background(Color.gray.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack {
                    HStack {
                        Spacer()
                        Text("거래4,127")
                            .font(.caption2)
                            .foregroundStyle(Color(.darkGray))
                            .padding(6)
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        ProductSaveButton(product: product, width: 20, height: 18)
                            .padding(8)
                    }
                }
                
            }.frame(width: 180, height: 180)
                .padding(.bottom, 6)
            
            VStack(alignment:.leading, spacing: 4) {
                Text(product.brandName)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(product.englishTitle)
                    .font(.caption)
                Text(product.title.splitChar())
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }.padding(.leading, 4)
            
            HStack(spacing:2) {
                
                Image("thunder")
                    .resizable()
                    .foregroundStyle(Color(#colorLiteral(red: 0, green: 0.8770952821, blue: 0.4751673341, alpha: 1)))
                    .frame(width: 18, height: 12)
                
                Text("빠른배송")
                    .font(.system(size: 9))
                    .foregroundStyle(Color(#colorLiteral(red: 0, green: 0.8770952821, blue: 0.4751673341, alpha: 1)))
                
            }.frame(width: 60, height: 18)
                .background(Color(#colorLiteral(red: 0, green: 0.8770952821, blue: 0.4751673341, alpha: 1)).opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(.bottom, 4)
                .padding(.leading, 4)
            
            VStack(alignment:.leading, spacing: 0) {
                Text("\(product.price)")
                    .fontWeight(.semibold)
                    .padding(.bottom, 8)
                
                Text("관심 6,366 ﹒리뷰 78")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }    .padding(.leading, 4)
         
            
        }.frame(width: 180)
        
    }
}
