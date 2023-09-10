//
//  MothionAnimationView.swift
//  Africa
//
//  Created by Amin on 10/09/2023.
//

import SwiftUI

struct MothionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    // random coordinate
    func randomCoordinate(max:CGFloat)->CGFloat{
        return CGFloat.random(in: 0...max)
    }
    // random size
    func randomSize()->CGFloat{
        return CGFloat(Int.random(in: 10...300))
    }
    // random scale
    func randomScale()->CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // random speed
    func randomSpeed()->Double{
        return Double.random(in: 0.025...1.0)
    }
    // random delay
    func randomDelay()->Double{
        return Double.random(in: 0...2)
    }
    var body: some View {
        GeometryReader { gr in
            ZStack {
                ForEach(0...randomCircle,id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray.opacity(0.15))
                        .frame(width: randomSize(), height: randomSize(),alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoordinate(max: gr.size.width), y: randomCoordinate(max: gr.size.height))
                        .animation(.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever().speed(randomSpeed()).delay(randomDelay()),value: isAnimating)
                }
                .onAppear {
                    isAnimating = true
                }
            }
            .drawingGroup()
        }
    }
}

struct MothionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MothionAnimationView()
    }
}
