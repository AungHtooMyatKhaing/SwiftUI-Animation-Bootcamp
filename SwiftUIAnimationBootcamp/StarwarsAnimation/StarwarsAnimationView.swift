//
//  StarwarsAnimationView.swift
//  SwiftUIAnimationBootcamp
//
//  Created by Aung Htoo Myat Khaing on 04/05/2025.
//

import SwiftUI

struct StarwarsAnimationView: View {
    
    private let starCount = 150
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ForEach(0..<starCount, id: \.self) { i in
                let angle = Double(i) / Double(starCount) * 360
                let delay = Double.random(in: 0...5)
                
                StarTrailView(angle: angle, delay: delay)
            }
            
            (Text("MAY THE\n") +
             Text("FORCE\n").foregroundStyle(.yellow) +
            Text("BE WITH YOU"))
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .font(.sfDistantGalaxyAlternate(size: 40))
                .italic()
                .opacity(animate ? 1 : 0)
            
        }
        .onAppear {
            withAnimation(.easeIn(duration: 2)) {
                animate = true
            }
        }
    }
}

#Preview {
    StarwarsAnimationView()
}

struct StarTrailView: View {
    
    let angle: Double
    let delay: Double
    
    @State private var animate = false
    
    var body: some View {
        let trailLength = animate ? 480.0 : 100.0
        let opacity = animate ? 1.0 : 0.0
        let width = CGFloat.random(in: 1...3)
        
        Rectangle()
            .fill(Color.white)
            .frame(width: width, height: 80)
            .offset(y: trailLength)
            .rotationEffect(.degrees(angle))
            .blur(radius: opacity)
            .opacity(opacity)
            .onAppear {
                withAnimation(.linear(duration: 3).delay(delay).repeatForever(autoreverses: false)) {
                    animate = true
                }
            }
    }
}
