//
//  ContentView.swift
//  OneMoreRep
//
//  Created by Ghufran on 3/17/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomePageViewModel()
    @State var userTappedUpperBody = false
    @State var userTappedLowerBody = false
    @State var isUpperPresed = false
    @State var isLowerPressed = false

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    if !viewModel.isLowerPressed {
                        upperBodyButton
                        Spacer()
                    }
                    if !viewModel.isUpperPresed {
                        lowerBodyButton
                        Spacer()
                    }
                    if viewModel.isUpperPresed {
                        UpperBodyWorkouts()
                        Spacer()
                    }
                    Spacer()
                }
                .onAppear {
                    viewModel.isLowerPressed = false
                    viewModel.isUpperPresed = false
                }
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .navigationTitle(viewModel.title)
        }
        .onTapGesture {
            withAnimation(.linear(duration: 0.3)) {
                viewModel.isLowerPressed = false
                viewModel.isUpperPresed = false
            }
        }
    }

    var lowerBodyButton: some View {
        VStack {
                ZStack {
                    clipShape(isSelected: viewModel.isLowerPressed)
                    Text("Lower\n Body")
                        .foregroundColor(.black)
                        .font(.system(size: viewModel.isLowerPressed ? 25 : 50, weight: .ultraLight))
                        .opacity(0.9)
                }
                .scaleEffect(viewModel.isLowerPressed ? 0.8 : 1.0)
                .edgesIgnoringSafeArea(.horizontal)
        }
        .pressEvents(onPress: {
            withAnimation(.linear(duration: 0.3)) {
                viewModel.isLowerPressed.toggle()
            }
            withAnimation(.linear(duration: 0.05)) {
                viewModel.isUpperPresed = false
            }
        }, onRelease: {})
    }

    var upperBodyButton: some View {
        VStack {
            ZStack {
                clipShape(isSelected: viewModel.isUpperPresed)
                Text("Upper\n Body")
                    .foregroundColor(.black)
                    .font(.system(size: viewModel.isUpperPresed ? 25 : 50, weight: .ultraLight))
                    .opacity(0.9)
            }
            .scaleEffect(viewModel.isUpperPresed ? 0.8 : 1.0)
            .edgesIgnoringSafeArea(.horizontal)
        }
        .pressEvents(onPress: {
            withAnimation(.linear(duration: 0.3)) {
                viewModel.isUpperPresed.toggle()
            }
            withAnimation(.linear(duration: 0.05)) {
                viewModel.isLowerPressed = false
            }
        }, onRelease: {})
    }

    @ViewBuilder
    func clipShape(isSelected: Bool) -> some View {
        VStack {
            RoundedRectangle(cornerRadius: isSelected ? 10 : 125)
                .foregroundColor(Color.white)
                .shadow(radius: isSelected ? 2 : 5)
                .opacity(0.5)
                .frame(height: isSelected ? 100 : 250)
                .frame(idealWidth: isSelected ? .infinity : 250, maxWidth: isSelected ? .infinity : 250)
                .edgesIgnoringSafeArea(.horizontal)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
