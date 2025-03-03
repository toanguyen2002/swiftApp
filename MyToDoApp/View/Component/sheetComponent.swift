//
//  sheetComponent.swift
//  MyToDoApp
//
//  Created by Toán Nguyễn on 27/2/25.
//


import SwiftUI

extension View {
    func sheetPlus<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.sheet(isPresented: isPresented) {
            content()
                .presentationDetents([.medium, .large]) // Có thể tùy chỉnh chiều cao
                .presentationDragIndicator(.visible) // Hiển thị thanh kéo
        }
    }
}
