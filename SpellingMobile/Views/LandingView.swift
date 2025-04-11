//
//  LandingView.swift
//  SpellingMobile
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

struct LandingView: View {
    
    // MARK: Computed properties
    var body: some View {
        TabView {
            QuizView()
                .tabItem {
                    Image(systemName: "questionmark.app.fill")
                    Text("Quiz")
                }

            HistoryView()
                .tabItem {
                    Image(systemName: "checklist")
                    Text("History")
                }

        }
    }
}

#Preview {
    LandingView()
        .environment(QuizViewModel())
}
