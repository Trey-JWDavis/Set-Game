//
//  Diamond.swift
//  Set Game
//
//  Created by Trey Davis on 1/12/21.
//

import SwiftUI

struct Diamond: Shape {

    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        
        var p = Path()
        p.move(to: top)
        p.addLines([left, bottom, right, top, left])
        
        return p
    }
}
