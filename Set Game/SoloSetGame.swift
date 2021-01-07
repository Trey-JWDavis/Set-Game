//
//  SoloSetGame.swift
//  Set Game
//
//  Created by Trey Davis on 1/7/21.
//

import SwiftUI

class SoloSetGame: ObservableObject {
    @Published var setGame: SetGame
    
    init() {
        setGame = SoloSetGame.createSetGame()
    }
    
    static func createSetGame() -> SetGame {
        SetGame()
    }
    
    // MARK: - Access to the model
    var cards: Array<SetGame.Card> { setGame.cards }
    
}
