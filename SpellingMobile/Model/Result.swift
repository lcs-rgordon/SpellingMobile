//
//  Result.swift
//  SpellingMobile
//
//  Created by Russell Gordon on 2025-04-10.
//


import Foundation

struct Result: Identifiable {
    
    let id = UUID()
    
    // The food item the user was supposed to guess in
    // round of the game just completed
    let item: Item
    
    // What the user actually guessed
    let guessProvided: String
    
    // Whether the user was correct or not
    let outcome: Outcome
    
}
