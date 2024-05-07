//
//  ContentView.swift
//  Next
//
//  Created by SABITOV Danil on 06.05.2024.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var tapped = false
    @State var animationAmount: Int = .zero
    @State var timer = Timer.publish(every: 1, on: .main, in: .common)
    
    var body: some View {
        Button(action: {
            timer = Timer.publish(every: 1, on: .main, in: .common)
            _ = timer.connect()
            withAnimation(.interpolatingSpring(stiffness: 50, damping: 9).speed(1.5)) {
                tapped = true
            } completion: {
                tapped = false
            }
            
        }, label: {
            HStack(spacing: -5) {
                if tapped {
                    Image(systemName: "play.fill")
                        .transition(.scale(.zero))
                }
                
                Image(systemName: "play.fill")
                
                if !tapped {
                    Image(systemName: "play.fill")
                        .transition(.scale(.zero))
                }
            }
        }).onReceive(timer) { _ in
            guard animationAmount <= 3 else {
                self.timer.connect().cancel()
                self.animationAmount = .zero
                return
            }
            
            withAnimation(.interpolatingSpring(stiffness: 50, damping: 9).speed(1.5)) {
                tapped = true
            } completion: {
                tapped = false
            }
            
            animationAmount += 1
        }
        
        .buttonStyle(.plain)
        .font(.largeTitle)
        .foregroundStyle(.blue)
    }
}

#Preview {
    ContentView()
}
