//
//  SetGame.swift
//  Set Game
//
//  Created by Trey Davis on 1/7/21.
//

import SwiftUI

struct SetGame {
    var cards: Array<Card>
    var visibleCards: Array<Card>
    var selectedCards: [Card]
    var score = 0
    var nextCardIndex: Int
    
    let shapeList = ["diamond", "rectangle", "capsule"]
    let shadingList = [0.0, 0.35, 1]
    let colorList = [Color.red, Color.green, Color.blue]
    
    init() {
        cards = Array<Card>()
        visibleCards = Array<Card>()
        selectedCards = [Card]()
        
        nextCardIndex = 0
        
        var id = 0
        for num in 1...3 {
            for shape in shapeList {
                for shading in shadingList {
                    for color in colorList {
                        cards.append(Card(numberOfShapes: num, shape: shape, shading: shading, color: color, id: id))
                        id += 1
                    }
                }
            }
        }
        cards.shuffle()
    }
    
    mutating func dealStartingCards() {
        for i in 0 ..< 12 {
            visibleCards.append(cards[i])
            nextCardIndex += 1
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = visibleCards.firstIndex(matching: card) {
            if let selectedCardsIndex = selectedCards.firstIndex(matching: visibleCards[chosenIndex]) {
                visibleCards[chosenIndex].isSelected.toggle()
                selectedCards.remove(at: selectedCardsIndex)
            } else {
                visibleCards[chosenIndex].isSelected.toggle()
                selectedCards.append(visibleCards[chosenIndex])
                print(selectedCards)
                if selectedCards.count == 3 {
                    if isSet(selectedCards) {
                        print("Set made!")
                        remove(set: selectedCards)
                        print("Set removed from Screen.")
                        if visibleCards.count < 12 {
                            addCards()
                            print("Added cards to maintain 12 on the screen")
                        }
                        score += 1
                        print("Score++")
                    } else {
                        if score > 0 { score -= 1 }
                        for index in 0..<selectedCards.count {
                            if let visibleCardIndex = visibleCards.firstIndex(matching: selectedCards[index]) {
                                visibleCards[visibleCardIndex].isSelected.toggle()
                            }
                        }
                        selectedCards = []
                        print("Not a set, score reduced by 1, selectedCards reset")
                    }
                }
            }
        } else {
            print("Error: Couldn't find user's card on the screen.")
        }
    }
    
    // Remove Set from the visible cards
    mutating func remove(set cards: Array<Card>) {
        for index in 0..<cards.count {
            visibleCards.remove(at: visibleCards.firstIndex(matching: cards[index])!)
        }
        selectedCards = []
    }
    
    // Add 3 cards to the screen when there are no Sets available
    mutating func addCards() {
        for i in 0 ..< 3 {
            visibleCards.append(cards[nextCardIndex + i])
            nextCardIndex += 1
        }
    }
    
    func isSet(_ cards: Array<Card>) -> Bool {
        let firstCard = cards[0]
        let secondCard = cards[1]
        let thirdCard = cards[2]
        
        // Each Card attribute must be equal or unique to qualify as a Set
        if isEqual(firstCard.numberOfShapes, secondCard.numberOfShapes, thirdCard.numberOfShapes) ||
            isUnique(firstCard.numberOfShapes, secondCard.numberOfShapes, thirdCard.numberOfShapes) {
            print("Numbers meet requirements")
            
            if isEqual(firstCard.color.description, secondCard.color.description, thirdCard.color.description) ||
                isUnique(firstCard.color.description, secondCard.color.description, thirdCard.color.description) {
                print("Colors meet requirements")
                
                if isEqual(firstCard.shading, secondCard.shading, thirdCard.shading) ||
                    isUnique(firstCard.shading, secondCard.shading, thirdCard.shading) {
                    print("Shadings meet the requirements")
                    
                    if isEqual(firstCard.shape, secondCard.shape, thirdCard.shape) ||
                        isUnique(firstCard.shape, secondCard.shape, thirdCard.shape) {
                        print("Shapes meet the requirements")
                    } else {
                        print("Shapes don't meet the requirements")
                        return false
                    }
                } else {
                    print("Shadings don't meet the requirements")
                    return false
                }
            } else {
                print("Colors don't meet requirements")
                return false
            }
        } else {
            print("Numbers don't meet requirements")
            return false
        }
        
        return true
    }
    
    
    // Returns true if all three parameters contain the same value
    private func isUnique<T: Comparable>(_ param1: T, _ param2: T, _ param3: T) -> Bool {
        if param1 != param2 && param2 != param3 && param3 != param1 { return true }
        return false
    }
    
    // Returns true if none of the parameters contain a similar value
    private func isEqual<T: Comparable>(_ arg1: T, _ arg2: T, _ arg3: T) -> Bool {
        if arg1 == arg2 && arg2 == arg3 { return true }
        return false
    }
    
    struct Card: Identifiable {
        var numberOfShapes: Int
        var shape: String
        var shading: Double
        var color: Color
        var id: Int
        var isSelected: Bool = false
    }
}
