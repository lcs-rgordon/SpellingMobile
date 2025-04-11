//
//  Searching.swift
//  SpellingMobile
//
//  Created by Russell Gordon on 2025-04-11.
//

// Define the function
//
// name: searching
//
// inputs:
//          the original array (originaList)
//          what to search against (searchText)
//
// output: an array with words that contain the search term
func searching(
    originalList: [Result],
    against searchText: String
) -> [Result] {
    
    // SEQUENCE (describe steps in order)
    
    // 0. If there is nothing to search against, return the entire array
    if searchText.isEmpty {
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
        //    e.g.: say "searchText" is "App"
        //          we will copy over only foodItems where the
        //          user's guess contains that string
        //          So, for example, "Apple" is a food item that would be returned
        if foodItem.guessProvided.lowercased().contains(searchText.lowercased()) {
            filteredHistory.append(foodItem)
        }
        
    }
    
    // 4. Return the filtered array
    return filteredHistory
    
}
