//
//  SecondPageView.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/23.
//

import SwiftUI

struct SecondPageView: View {
    var body: some View {
        Text("Features")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
        
        Text("Discover the features of 28Xiu!")
            .fontWeight(.medium)
            .padding()
            .foregroundColor(.indigo)
    }
}

#Preview {
    SecondPageView()
}
