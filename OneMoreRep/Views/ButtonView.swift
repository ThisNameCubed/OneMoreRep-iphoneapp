//
//  ButtonView.swift
//  OneMoreRep
//
//  Created by Ghufran on 4/23/23.
//

import SwiftUI

struct ButtonView: View {
    @State var buttonClicked: Bool = false
    @State var name: String = ""

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: CGFloat(20), style: .continuous)
                .foregroundColor(.white)
                .opacity(0.5)
                .shadow(radius: buttonClicked ? 0 : 2, x: -1, y: 2)
            HStack {
                Spacer()
                Text(name)
                    .foregroundColor(.black)
                Spacer()
            }
        }
        .frame(height: 60)
        .padding(.horizontal, 40)
        .padding(.vertical, 10)
        .scaleEffect(buttonClicked ? 0.95 : 1.0)
        .pressEvents(onPress: {
            withAnimation(.linear(duration: 0.05)) {
                buttonClicked.toggle()
            }
        }, onRelease: {
            withAnimation(.linear(duration: 0.05)) {
                buttonClicked.toggle()
            }
        })
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
