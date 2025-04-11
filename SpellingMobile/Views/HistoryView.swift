//
//  HistoryView.swift
//  SpellingMobile
//
//  Created by Russell Gordon on 2025-04-11.
//

import SwiftUI

struct HistoryView: View {
    
    // MARK: Stored properties
    @Environment(QuizViewModel.self) var viewModel
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                
                // Create a two-way binding to the view model through the
                // environment
                @Bindable var viewModelBindable = viewModel
               
                // Picker to select what outcome to show
                Picker("Filtering on", selection: $viewModelBindable.selectedOutcomeFilter) {
                    // Options that show up in the picker
                    Text("All results").tag(Outcome.undetermined)
                    Text("Correct").tag(Outcome.correct)
                    Text("Incorrect").tag(Outcome.incorrect)
                }
                .pickerStyle(.segmented)
                
                // Show previous outcomes (might be filtered)
                List(
                    filtering(
                        originalList: viewModel.history,
                        on: viewModel.selectedOutcomeFilter
                    )
                ) { currentResult in
                    
                    HStack {

                        Image(currentResult.item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                        
                        Text(currentResult.guessProvided)
                        
                        Spacer()
                        
                        Text(currentResult.outcome.rawValue)
                            
                    }
                   
                }
                .listStyle(.plain)

                
            }
            .padding()
            .navigationTitle("History")
        }

    }
}

#Preview {
    HistoryView()
        .environment(QuizViewModel())
}
