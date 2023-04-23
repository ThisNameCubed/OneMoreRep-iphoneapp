//
//  UpperBodyWorkouts.swift
//  OneMoreRep
//
//  Created by Ghufran on 4/23/23.
//

import SwiftUI

struct UpperBodyWorkouts: View {
    @StateObject var viewModel = UpperBodyViewModel()
    @State var buttonClicked = false
    @State var showButton = false

    var body: some View {
        buttonViewAnimate(with: "Arms", listNumber: 0)
        buttonViewAnimate(with: "Core", listNumber: 1)
        buttonViewAnimate(with: "Chest", listNumber: 2)
    }

    @ViewBuilder
    func buttonViewAnimate(with name: String, listNumber: Int) -> some View {
            ButtonView(name: name)
            .deferredRendering(for: Double(listNumber) * 0.1)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing))
                    .combined(with: .opacity))
            
    }
}
struct UpperBodyWorkouts_Previews: PreviewProvider {
    static var previews: some View {
        UpperBodyWorkouts()
    }
}
