//
//  bottomButtonView.swift
//  Kreamclone
//
//  Created by JIN on 6/10/25.
//

import SwiftUI

struct bottomButtonView: View {
    let product: Product
    var body: some View {
        
        HStack{
            ProductSaveButton(product: product, width: 24, height: 22)
                .padding(8)
                     
                     Button(action: {
                     }) {
                         HStack {
                             Text("구매")
                                 .fontWeight(.semibold)
                                 .padding(.trailing)
                              
                             Divider()
                             VStack(alignment:.leading) {
                                 Text("830000")
                                     .font(.system(size: 13))
                                     .fontWeight(.semibold)
                                 Text("즉시판매가")
                                     .foregroundStyle(.black)
                                     .foregroundStyle(.secondary)
                                     .font(.system(size: 10))
                             }
                          
                             
                          }.frame(width: 155, height: 45)
                          .background(Color(#colorLiteral(red: 0.9079461694, green: 0.3712126613, blue: 0.2423006296, alpha: 1)))
                          .clipShape(RoundedRectangle(cornerRadius: 8))
                          .foregroundColor(.white)
                   
                     }
                     
                     Button(action: {
                     }) {
                         Text("판매")
                             .fontWeight(.semibold)
                             .foregroundColor(.white)
                             .frame(width: 155, height: 45)
                             .background(Color(#colorLiteral(red: 0, green: 0.7259930968, blue: 0.437939465, alpha: 1)))
                             .clipShape(RoundedRectangle(cornerRadius: 8))
                     }.padding(.trailing)
                 }
                 .frame(height: 60)
                 .background(Color.white)
                 .background(Color.white
                    .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: -2)
                   )
     
            
    }
}

