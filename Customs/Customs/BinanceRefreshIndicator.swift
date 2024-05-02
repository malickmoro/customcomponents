//
//  BinanceRefreshIndicator.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//
import SwiftUI

struct BinanceRefreshIndicator: View {
    @State private var offsetValue: CGFloat = 0
    @State private var newOffsetValue: CGFloat = 0
    @State private var showIcon: Bool = false
    @State private var iconName: String = "arrow.down.circle.fill"  // Initial icon

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            GeometryReader { bounds in
                VStack {
                    // Place the icon outside of the blue VStack
                    if showIcon {
                        VStack {
                            Image(systemName: iconName)
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .animation(.easeInOut, value: showIcon)
                                .transition(.opacity)
                        
                            
                            Text("Please wait...")
                                .foregroundStyle(.blue)
                        }
                        .padding()
                        .offset(CGSize(width: 0, height: newOffsetValue))
                        .onChange(of: offsetValue) { value in
                            withAnimation {
                                newOffsetValue = value
                            }
                        }
                    }
                    
                    // Blue VStack
                    VStack {
                        Spacer()  // Keeps the VStack's contents pushed to the bottom
                    }
                    .frame(width: bounds.size.width, height: bounds.size.height)
                    .background(Color.blue)
                    .offset(y: offsetValue)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.offsetValue = gesture.translation.height
                                // Show the icon only if pulled down enough
                                if self.offsetValue > 60 {
                                    self.showIcon = true
                                }
                            }
                            .onEnded { _ in
                                withAnimation(.smooth) {
                                    self.iconName = "checkmark.circle.fill"  // Change icon after drag ends
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation(.easeOut(duration: 0.5)) {
                                            self.showIcon = false  // Hide icon after a few seconds
                                            self.iconName = "arrow.down.circle.fill"  // Reset icon
                                        }
                                      
                                    }
                                }
                                self.offsetValue = 0  // Reset offset after drag ends
                            }
                    )
                }
            }
        }
    }
}


#Preview {
    BinanceRefreshIndicator()
}
