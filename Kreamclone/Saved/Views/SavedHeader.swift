//
//  SavedHeader.swift
//  Kreamclone
//
//  Created by JIN on 6/20/25.
//

import SwiftUI

struct SavedHeader: View {
    // 바인딩해서 동적으로 수량을 바꿀 수도 있어요
    var title: String
    var cartCount: Int

    var body: some View {
        HStack {
            // 왼쪽: 타이틀
            Text(title)
                .font(.system(size: 32, weight: .bold))
                .padding(.leading, 20)

            Spacer()
            
            // 오른쪽: 장바구니 아이콘 + 배지
            NavigationLink(destination: CartView()) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "bag")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.black)
                    
                    // 배지(수량)
                    if cartCount > 0 {
                        Text("\(cartCount)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 10, y: -10)
                    }
                }
                .padding(.trailing, 20)
            }
        }
        .padding(.vertical, 8)
    }
}

// 임시 CartView (네비게이션 이동용)
struct CartView: View {
    var body: some View {
        Text("Cart")
    }
}

struct CustomCartView: View {
    // 예시로 수량 1개
    @State private var cartCount = 1
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SavedHeader(title: "Saved", cartCount: cartCount)
                Divider()
                Spacer()
                // 아래에 본문 내용
            }
            .navigationBarHidden(true) // 기존 네비게이션바 숨김
        }
    }
}

#Preview {
    CustomCartView()
}
