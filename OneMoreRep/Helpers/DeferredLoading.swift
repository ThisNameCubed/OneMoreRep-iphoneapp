//
//  DeferredLoading.swift
//  OneMoreRep
//
//  Created by Ghufran on 4/23/23.
//

import Foundation
import SwiftUI
private struct DeferredViewModifier: ViewModifier {

    // MARK: API

    let threshold: Double

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        _content(content)
            .onAppear {
               DispatchQueue.main.asyncAfter(deadline: .now() + threshold) {
                   withAnimation(.linear(duration: 0.3)) {
                       self.shouldRender = true
                   }
               }
            }
    }

    // MARK: - Private

    @ViewBuilder
    private func _content(_ content: Content) -> some View {
        if shouldRender {
            content
        } else {
            content
                .hidden()
        }
    }

    @State
    private var shouldRender = false
}

extension View {
    func deferredRendering(for seconds: Double) -> some View {
        modifier(DeferredViewModifier(threshold: seconds))
    }
}
