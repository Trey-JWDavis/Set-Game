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
                    }.padding(5)
                }
                .padding()
                Button(action: { soloSetGame.addCards() }) {
                    ZStack {
                        Capsule().frame(width: 250, height: 50).foregroundColor(.purple)
                        Text("Add Cards").foregroundColor(.white)
                    }
                }.padding(.horizontal)
            }
            .navigationBarTitle("Score: \(soloSetGame.score)", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: { soloSetGame.createNewGame() }) {
                Image(systemName: "arrow.clockwise")
            })
        }
    }
}

struct CardView: View {
    var card: SetGame.Card
    
    var body: some View {
        // TODO: - Extract repeated code
        if card.isSelected {
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.orange)
                RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 3)
                GeometryReader { geo in
                    VStack {
                        Spacer()
                        ForEach(0..<card.numberOfShapes) { _ in
                            if card.shape == "diamond" {
                                ZStack {
                                    Diamond()
                                        .opacity(card.shading)
                                    Diamond()
                                        .stroke(lineWidth: 3)
                                }.padding(3)
                            } else if card.shape == "rectangle" {
                                ZStack {
                                    Rectangle()
                                        .opacity(card.shading)
                                    Rectangle()
                                        .stroke(lineWidth: 3)
                                }.padding(3)
                            } else {
                                ZStack {
                                    Capsule()
                                        .opacity(card.shading)
                                    Capsule()
                                        .stroke(lineWidth: 3)
                                }.padding(3)
                            }
                        }.frame(height: geo.size.height / 4)
                        Spacer()
                    }
                    .padding()
                    .foregroundColor(card.color)
                }
            }
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.yellow)
                RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 3)
                GeometryReader { geo in
                    VStack {
                        Spacer()
                        ForEach(0..<card.numberOfShapes) { _ in
                            if card.shape == "diamond" {
                                ZStack {
                                    Diamond()
                                        .opacity(card.shading)
                                    Diamond()
                                        .stroke(lineWidth: 3)
                                }.padding(3)
                            } else if card.shape == "rectangle" {
                                ZStack {
                                    Rectangle()
                                        .opacity(card.shading)
                                    Rectangle()
                                        .stroke(lineWidth: 3)
                                }.padding(3)
                            } else {
                                ZStack {
                                    Capsule()
                                        .opacity(card.shading)
                                    Capsule()
                                        .stroke(lineWidth: 3)
                                }.padding(3)
                            }
                        }
                            // - TODO: Make aspect ratios not hardcoded
                        .frame(height: geo.size.height / 4)
                        Spacer()
                    }
                }
                .padding()
                .foregroundColor(card.color)
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
