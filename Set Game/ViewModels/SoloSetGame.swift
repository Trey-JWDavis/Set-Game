//
//  SoloSetGame.swift
//  Set Game
//
//  Created by Trey Davis on 1/7/21.
//

import SwiftUI

class SoloSetGame: ObservableObject {
    @Published var setGame: SetGame
    
    init() { setGame = SoloSetGame.createSetGame() }
    
    static func createSetGame() -> SetGame { SetGame() }
    
    func createNewGame() { setGame = SoloSetGame.createSetGame() }
    
    
    // MARK: - Access
    var visibleCards: Array<SetGame.Card> { setGame.visibleCards }
    
    var score: Int { setGame.score }
    
    
    // MARK: - Intents
    func addCards() { setGame.addCards() }
    
    func choose(card: SetGame.Card) { setGame.choose(card: card) }
    
    func dealStartingCards() { setGame.dealStartingCards() }
}
