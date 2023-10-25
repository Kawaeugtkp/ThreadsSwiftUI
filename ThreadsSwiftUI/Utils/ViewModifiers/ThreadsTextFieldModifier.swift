//
//  ThreadsTextFieldModifier.swift
//  ThreadsSwiftUI
//
//  Created by 川尻辰義 on 2023/09/03.
//

import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 24)
    }
}
