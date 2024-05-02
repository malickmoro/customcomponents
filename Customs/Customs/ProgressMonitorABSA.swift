//
//  ProgressMonitorABSA.swift
//  Customs
//
//  Created by Malick Moro-Samah on 28/04/2024.
//

import SwiftUI

struct ProgressMonitorABSA: View {
    @State private var total: CGFloat = 5
    @State private var step: CGFloat = 1
    
    var progressFraction: CGFloat {
        guard total != 0 && step <= total else { return 0 }  // Avoid division by zero
        return step / total
    }
    
    var body: some View {
        GeometryReader { reader in
            VStack(alignment: .center, spacing: 4) {
                progressHeader
                progressBar(width: reader.size.width - 15)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal, 7)
        }
    }
    
    private var progressHeader: some View {
        HStack(spacing: 3) {
            Text("Step")
            Text("\(Int(step))")
            Text("of")
            Text("\(Int(total))")
            Spacer()
        }
        .font(.system(size: 12, weight: .bold))
        .foregroundStyle(.primary)
    }
    
    private func progressBar(width: CGFloat) -> some View {
        ZStack(alignment: .leading) {
            // Background of the progress bar
            Rectangle()
                .fill(Color.green.opacity(0.2))
                .frame(width: width, height: 5)
                .cornerRadius(2.5)
            
            // Foreground of the progress bar indicating progress
            Rectangle()
                .fill(Color.green)
                .frame(width: width * progressFraction, height: 5)
                .cornerRadius(2.5)
        }
    }

}


#Preview {
    ProgressMonitorABSA()
}
