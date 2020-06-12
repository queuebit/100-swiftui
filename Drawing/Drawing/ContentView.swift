//
//  ContentView.swift
//  Drawing
//
//  Created by Paul Gagnon on 6/4/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct Arrow: Shape {
    var arrowRatio: CGFloat
    var insetAmount: CGFloat

    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let shaftWidth = rect.maxX - rect.minX - 2 * insetAmount
        let arrowLength = rect.maxY - rect.minY
        let arrowHeadLength = arrowRatio * arrowLength
        let shaftLength = (1 - arrowRatio)  * arrowLength

        path.addRect(CGRect(x: rect.minX + insetAmount, y: arrowHeadLength, width: shaftWidth, height: shaftLength))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: arrowHeadLength))
        path.addLine(to: CGPoint(x: rect.minX, y: arrowHeadLength))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
   }
}

struct Trapezoid: Shape {
    var insetAmount: CGFloat

    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct ContentView: View {
    @State private var arrowRatio: CGFloat = 0.25
    @State private var insetAmount: CGFloat = 75

    var body: some View {
        Arrow(arrowRatio: arrowRatio, insetAmount: insetAmount)
            .frame(width: 200, height: 300)
            .onTapGesture {
                withAnimation {
                    self.arrowRatio = CGFloat.random(in: 0.1...0.5)
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
