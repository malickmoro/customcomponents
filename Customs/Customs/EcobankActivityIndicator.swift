//
//  ActivityIndicator.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct ActivityIndicator: View {
    @State var logo: String
    @State var isAnimating: Bool
    
    var body: some View {
        GeometryReader { bounds in
            VStack(spacing: 15) {
                Image(systemName: logo)
                    .resizable()
                    .frame(width: 40, height: 10)
                    .foregroundColor(.white)
                    .padding(25)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 5)
                            .fill(.white.opacity(0.3))
                            .overlay(
                                Circle()
                                    .trim(from: 0, to: 0.2)
                                    .stroke(Color.white, lineWidth: 5)
                                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
                            )
                            .onAppear() {
                                isAnimating = true
                            }
                    }
                
                
                Text("Just a few more seconds")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                   
            }
            .frame(width: bounds.size.width, height: bounds.size.height)
        }
        .ignoresSafeArea()
        .background(.blue.opacity(0.7))
    }
}

#Preview {
    ActivityIndicator(logo: "ellipsis", isAnimating: false)
}
