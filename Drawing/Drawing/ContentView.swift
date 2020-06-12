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

    public var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
           AnimatablePair(arrowRatio, insetAmount)
        }

        set {
            self.arrowRatio = newValue.first
            self.insetAmount = newValue.second
        }
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

struct ColorCyclingSquare: View {
    var amount = 0.0
    var steps = 100
    var gradStart: UnitPoint = UnitPoint(x: 0, y: 50)
    var gradEnd: UnitPoint = UnitPoint(x: 0, y: 75)

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: self.gradStart, endPoint: self.gradEnd), lineWidth: 2)
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var arrowRatio: CGFloat = 0.25
    @State private var insetAmount: CGFloat = 75
    @State private var colorCycle = 0.0

    var body: some View {
        VStack {
            Arrow(arrowRatio: arrowRatio, insetAmount: insetAmount)
                .frame(width: 200, height: 300)
                .onTapGesture {
                    withAnimation {
                        self.arrowRatio = CGFloat.random(in: 0.1...0.5)
                        self.insetAmount = CGFloat.random(in: 10...90)
                    }
                }
            VStack {
                ColorCyclingSquare(amount: self.colorCycle)
                    .frame(width: 300, height: 300)

                Slider(value: $colorCycle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
