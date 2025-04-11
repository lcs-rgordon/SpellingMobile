//
//  QuizViewModel.swift
//  SpellingMobile
//
//  Created by Russell Gordon on 2025-04-10.
//

import Foundation

@Observable
class QuizViewModel {
    
    // MARK: Stored properties

    // An item the user is supposed to spell
    // (randomly select one food item to start)
    var currentItem: Item = itemsToSpell.randomElement()!
    
    // The name of the food item that the user guessed
    // (empty to start)
    var userGuess: String = ""
    
    // The outcome of the user making a guess
    // (we don't yet know whether they will guess
    //  correctly or incorrectly)
    var currentOutcome: Outcome = .undetermined
    
    // A list of previous results of guesses in the game
    // (empty to start)
    var history: [Result] = []
    
    // Keep track of what the user selected from the picker for filtering
    // (not yet used in the app, but will be soon)
    var selectedOutcomeFilter: Outcome = .undetermined
    
    // Keep track of whether the new word button should be disabed
    // It is "true" to start since when the view model first loads,
    // a new word is already presented to the user.
    var isNewWordButtonDisabled = true
    
    // MARK: Initializer(s)
    init() {
        // Initializer is included but doesn't need
        // to do anything, since we have given all
        // properties of the class an initial value
        // above
    }
    
    // MARK: Function(s)
    
    // Check the user's guess
    func checkGuess() {
        
        // Change capitals to lowercase before comparing
        // Then see if what the user typed is accurate
        if userGuess.lowercased() == currentItem.word {
            currentOutcome = .correct
        } else {
            currentOutcome = .incorrect
        }
        
        // New word button should now be enabled so user
        // can keep playing the game
        isNewWordButtonDisabled = false
        
    }
    
    // Save the prior result
    func saveResult() {
        
        // Insert the most recent result at the top of the list (array)
        history.insert(
            Result(
                item: currentItem,
                guessProvided: userGuess,
                outcome: currentOutcome
            ),
            at: 0
        )
        
    }
    
    // Set up a new round of this quiz game
    func newWord() {
        
        // Randomly select a food item from the list of items to spell
        currentItem = itemsToSpell.randomElement()!
        
        // Make the user guess an empty string to start
        userGuess = ""
        
        // We don't yet know what the outcome of the user's guess is
        currentOutcome = .undetermined
        
        // Once a new word is selected, disable the
        // new word button again
        isNewWordButtonDisabled = true
    }
        
}
