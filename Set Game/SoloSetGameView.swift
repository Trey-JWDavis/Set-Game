//
//  ContentView.swift
//  Set Game
//
//  Created by Trey Davis on 1/7/21.
//

import SwiftUI

struct SoloSetGameView: View {
    @ObservedObject var soloSetGame: SoloSetGame
    
    var body: some View {
        VStack {
            Text("Number: \(soloSetGame.cards[0].number)")
            Text("Shape: " + soloSetGame.cards[0].shape)
            Text("Shading: \(soloSetGame.cards[0].shading)")
            Text("Color: " + soloSetGame.cards[0].color)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let soloSetGame = SoloSetGame()
    static var previews: some View {
        SoloSetGameView(soloSetGame: soloSetGame)
    }
}
