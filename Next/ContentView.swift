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
    
    var body: some View {
        Button(action: {
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
        })
        
        .buttonStyle(.plain)
        .font(.largeTitle)
        .foregroundStyle(.blue)
    }
}

#Preview {
    ContentView()
}
