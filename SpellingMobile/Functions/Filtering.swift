//
//  Filtering.swift
//  SpellingMobile
//
//  Created by Russell Gordon on 2025-04-10.
//

import Foundation

// Define the function
//
// name: filtering
//
// inputs:
//          the original array (originaList)
//          what to filter on (desiredOutcome)
//
// output: an array filtered based on outcome
func filtering(
    originalList: [Result],
    on desiredOutcome: Outcome
) -> [Result] {
    
    // SEQUENCE (describe steps in order)
    
    // 0. See if the user selected "All results"
    if desiredOutcome == .undetermined {
        return originalList
    }
    
    // 1. Make a new empty array
    var filteredHistory: [Result] = []
    
    // 2. Iterate over each item
    //    in the original array and decide
    //    whether to copy it to the filtered one
    //
    //    "foodItem" points at each element in the array in turn
    for foodItem in originalList {
        
        // 3. Decide whether to copy over
        //    e.g.: say "desiredOutcome" is "correct"
        //          we will copy over only foodItems the user guessed
        //          correctly
        if foodItem.outcome == desiredOutcome {
            filteredHistory.append(foodItem)
        }
        
    }
    
    // 4. Return the filtered array
    return filteredHistory
    
}







