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
            cardGridView
            Spacer()
            addCardsButton
        }
        .onAppear { withAnimation { soloSetGame.dealStartingCards() } }
        .navigationTitle("Score: \(soloSetGame.score)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { newGameButton }
    }
}


struct ContentView_Previews: PreviewProvider {
    static let soloSetGame = SoloSetGame()
    
    static var previews: some View {
        NavigationView {
            SoloSetGameView(soloSetGame: soloSetGame)
        }
    }
}


extension SoloSetGameView {
    
    private var addCardsButton: some View {
        Button(action: {
            withAnimation() { soloSetGame.addCards() }
        }) {
            ZStack {
                Capsule().frame(width: 250, height: 50).foregroundColor(.purple)
                Text("Add Cards").foregroundColor(.white)
            }
        }.padding(.horizontal)
    }
    
    private var cardGridView: some View {
        Grid(soloSetGame.visibleCards) { card in
            CardView(card: card)
                .animation(.easeInOut(duration: 0.35))
                .onTapGesture {
                    withAnimation() {
                        soloSetGame.choose(card: card)
                    }
            }.padding(5)
        }.padding()
    }
    
    private var newGameButton: some View {
        Button(action: {
            withAnimation(){
                soloSetGame.createNewGame()
                soloSetGame.dealStartingCards()
            }
        }) {
            Image(systemName: "arrow.clockwise")
        }
    }
}


extension AnyTransition {
    static var randomMove: AnyTransition {
        let insertion = AnyTransition.offset(x: CGFloat(1000), y: CGFloat(1000))
        let removal = AnyTransition.offset(x: CGFloat(-1000), y: CGFloat(-1000))
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


