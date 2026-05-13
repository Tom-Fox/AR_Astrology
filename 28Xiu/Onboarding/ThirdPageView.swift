//
//  ThirdPageView.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/23.
//

import SwiftUI

struct ThirdPageView: View {
    
    @Binding var didTap: Bool
    
    var body: some View {
        Text("Get Started")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
        
        
        
        Text("Get started with 28Xiu!")
            .fontWeight(.medium)
            .padding()
            .foregroundColor(.indigo)
    }
}

#Preview {
    ThirdPageView(didTap: .constant(true))
}
