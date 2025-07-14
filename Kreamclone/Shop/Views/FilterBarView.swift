//
//  FilterBarView.swift
//  Kreamclone
//
//  Created by JIN on 6/6/25.
//

import SwiftUI

struct FilterBarView: View {
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Label("정가 이하", systemImage: "circle")
                Label("품절 제외", systemImage: "circle")
            }
            .font(.system(size: 14))

            Spacer()

            HStack(spacing: 4) {
                Text("추천순")
                Image(systemName: "arrow.up.arrow.down")
            }
            .font(.system(size: 14))
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.white)
    }
}

#Preview {
    FilterBarView()
}
