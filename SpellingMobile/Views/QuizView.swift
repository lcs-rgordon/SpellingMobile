//
//  QuizView.swift
//  SpellingMobile
//
//  Created by Russell Gordon on 2025-04-10.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: Stored properties
    @Environment(QuizViewModel.self) var viewModel
        
    // MARK: Computed properties
    
    // This presents the user interface
    var body: some View {
        
        NavigationStack {
            
            // Create a two-way binding to the view model through the
            // environment
            @Bindable var viewModelBindable = viewModel
            
            VStack {

                // Top of interface shows food item to guess
                VStack {
                    Image(viewModel.currentItem.imageName)
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        TextField("Enter the name of the item", text: $viewModelBindable.userGuess)
                            .textFieldStyle(.roundedBorder)

                        Text(viewModel.currentOutcome.rawValue)
                    }
                        
                    HStack {
                    
                        // Let the user pick a new word
                        Button {
                            viewModel.saveResult()
                            viewModel.newWord()
                        } label: {
                            Text("New Word")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .disabled(viewModel.isNewWordButtonDisabled)

                        // Let the user check their guess
                        Button {
                            viewModel.checkGuess()
                        } label: {
                            Text("Check")
                        }
                        .buttonStyle(.borderedProminent)
                        
                    }
                    
                }
                .padding()
                                
            }
            .navigationTitle("Quiz")

        }
        
    }
}

#Preview {
    QuizView()
        .environment(QuizViewModel())
}
