//
//  HomePageViewModel.swift
//  OneMoreRep
//
//  Created by Ghufran on 4/10/23.
//

import Foundation

class HomePageViewModel: ObservableObject {
    @Published var isUpperPresed: Bool = false
    @Published var isLowerPressed = false
    @Published var userTappedLowerBody = false
    @Published var userTappedUpperBody = false
    @Published var title = "Workouts"
    @Published var upperbodyTitle = "Upper\n Body"

    
//    func getTitle() -> String {
//        var title = "Workouts"
//        title = isUpperPresed ? "Upper body" : "Workouts"
//        title = isLowerPressed ? "Lower Body" : "Workouts"
//        return title
//    }
}
