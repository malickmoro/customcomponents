//
//  BinanceAlert.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct BinanceAlert: View {
    @Environment(\.colorScheme) var scheme
    @State var message: String
    @Binding var dismiss: Bool
    
    var body: some View {
        GeometryReader { bounds in
            VStack {
                Rectangle().fill(scheme == .dark ? .black : .white)
                    .frame(width: bounds.size.width - 100, height: bounds.size.height / 3.3)
                    .cornerRadius(10)
                    .overlay {
                        GeometryReader { geometry in
                            VStack(spacing: 0) {
                                Circle()
                                    .fill(.yellow.opacity(0.3))
                                    .frame(width: 60)
                                    .overlay {
                                        Image(systemName: "exclamationmark.circle.fill")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.yellow)
                                            .fontWeight(.bold)
                                    }
                                
                                
                                Text(message)
                                    .font(.subheadline)
                                    .fontWeight(.light)
                                    .frame(height: 40)
                                    .padding()
                                
                                Button{dismiss.toggle()} label: {
                                    Text("OK")
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                        .frame(width: geometry.size.width - 40, height: 40)
                                        .background(.yellow)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(.bottom, 4)
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                    }
                        
            }
            .frame(width: bounds.size.width, height: bounds.size.height)
            .background(.black.opacity(0.4))
        }
    }
}

#Preview {
    BinanceAlert(message: "Request timed out, please check your network status", dismiss: .constant(false))
}
