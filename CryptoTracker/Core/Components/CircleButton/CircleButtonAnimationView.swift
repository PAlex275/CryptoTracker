//
//  CircleButtonAnimationView.swift
//  CryptoTracker
//
//  Created by Alex Petrisor on 17.04.2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1): .none,value: UUID())
            .onAppear{
                animate.toggle()
            }
            
        
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
}
