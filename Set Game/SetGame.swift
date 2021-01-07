//
//  SetGame.swift
//  Set Game
//
//  Created by Trey Davis on 1/7/21.
//

import Foundation

struct SetGame {
    var cards: Array<Card>
    
    init() {
        cards = Array<Card>()
        cards.append(Card(number: 1, shape: "Diamond", shading: 0.5, color: "blue"))
    }
    
    struct Card {
        var number: Int
        var shape: String
        var shading: Float
        var color: String
    }
}
