//
//  SpellingMobileApp.swift
//  SpellingMobile
//
//  Created by Russell Gordon on 2025-04-10.
//

import SwiftUI

@main
struct SpellingMobileApp: App {
    
    // MARK: Stored properties
    
    // Access the view model which runs the mechanics
    // of the game for us
    @State var viewModel = QuizViewModel()
    
    // MARK: Computed properties
    var body: some Scene {
        WindowGroup {
            LandingView()
            // Add the view model to the environment so
            // data can be used by other views
            .environment(viewModel)
        }
    }
}
