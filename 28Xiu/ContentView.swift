//
//  ContentView.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/8.
//

import SwiftUI
import RealityKit
import Combine
import UIKit

struct ContentView: View {
    
//    @AppStorage("shouldShowOnboarding") private var shouldShowOnboarding = true
    @State private var shouldShowOnboarding = true
    @Binding var didTap: Bool
       
    var body: some View {
        
        AppTabView()
        .sheet(isPresented: $shouldShowOnboarding){
            OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)

        }
    }
    
}


#Preview {
    ContentView(didTap: .constant(true))
}
