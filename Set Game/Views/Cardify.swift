//
//  Cardify.swift
//  Set Game
//
//  Created by Trey Davis on 1/18/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var selected: Bool
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            ZStack {
                if selected { RoundedRectangle(cornerRadius: cornerRadius).fill(selectedColor) }
                else { RoundedRectangle(cornerRadius: cornerRadius).fill(unselectedColor) }
                
                RoundedRectangle(cornerRadius: cornerRadius).stroke(strokeColor, lineWidth: edgeLineWidth)
                content
            }
        }
    }
    
    // MARK: -  Drawing Constants
    private let strokeColor: Color = .gray
    private let selectedColor: Color = .orange
    private let unselectedColor: Color = .yellow
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(selected: Bool) -> some View {
        self.modifier(Cardify(selected: selected))
    }
}
