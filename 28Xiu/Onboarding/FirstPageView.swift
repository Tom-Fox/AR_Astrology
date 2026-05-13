//
//  FirstPageView.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/23.
//

import SwiftUI

struct FirstPageView: View {
    var body: some View {
        Text("Welcome")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
        
        Text("Welcome to 28Xiu!")
            .fontWeight(.medium)
            .padding()
            .foregroundColor(.indigo)
    }
}

#Preview {
    FirstPageView()
}
