//
//  CardView.swift
//  CardView
//
//  Created by Trey Davis on 1/21/22.
//

import SwiftUI

struct CardView: View {
    var card: SetGame.Card

    let randomCardX = CGFloat(Int.random(in: -1000 ..< -250))
    let randomCardY = CGFloat(Int.random(in: -1000 ..< -250))

    var body: some View {
        GeometryReader { geo in
            Group {
                VStack() {
                    ForEach(0..<card.numberOfShapes) { _ in
                        if card.shape == "diamond" {
                            ZStack {
                                Diamond().opacity(card.shading)
                                Diamond().stroke(lineWidth: cardStrokeWidth)
                            }
                        } else if card.shape == "rectangle" {
                            ZStack {
                                Rectangle().opacity(card.shading)
                                Rectangle().stroke(lineWidth: cardStrokeWidth)
                            }
                        } else {
                            ZStack {
                                Capsule().opacity(card.shading)
                                Capsule().stroke(lineWidth: cardStrokeWidth)
                            }
                        }
                    }
                }.frame(height: CGFloat(card.numberOfShapes) / maxShapes * geo.size.height)
            }.frame(width: geo.size.width, height: geo.size.height)
        }
            .padding()
            .cardify(selected: card.isSelected)
            .foregroundColor(card.color)
    }
    
    private let maxShapes: CGFloat = 3
    private let cardStrokeWidth: CGFloat = 3
}

// TODO: Fix preview
//struct CardView_Previews: PreviewProvider {
//
//    var card: SetGame.Card = SetGame.Card(numberOfShapes: 1, shape: "capsule", shading: 0, color: .red, id: 0)
//    static var previews: some View {
//        CardView(card: card)
//    }
//}
