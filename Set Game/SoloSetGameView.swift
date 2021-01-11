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
        NavigationView {
            VStack {
                Grid(soloSetGame.visibleCards){ card in
                    CardView(card: card).onTapGesture {
                        soloSetGame.choose(card: card)
                    }
                        .padding(5)
                }
                .padding()
                Button(action: { soloSetGame.addCards() }) {
                    Text("Add Cards")
                }
                    .padding()
            }
            .navigationBarTitle("\(soloSetGame.score)", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: { soloSetGame.createNewGame() }) {
                Image(systemName: "arrow.clockwise")
            })
        }
    }
}

struct CardView: View {
    var card: SetGame.Card
    
    var body: some View {
        if card.isSelected {
//            ZStack {
//                RoundedRectangle(cornerRadius: 10).fill(Color.orange)
//                RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 3)
//                VStack {
//                    Text("\(card.numberOfShapes)")
//                    Text(card.color)
//                    Text(card.shape)
//                    Text("\(card.shading)")
//                }
//                .shadow(radius: 5)
//            }
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.orange)
                RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 3)
                VStack {
                    Text("\(card.numberOfShapes)")
                    Text(card.color)
                    Text(card.shape)
                    Text("\(card.shading)")
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static let soloSetGame = SoloSetGame()
    static var previews: some View {
        SoloSetGameView(soloSetGame: soloSetGame)
    }
}
