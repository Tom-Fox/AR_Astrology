//
//  OnboardingView.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/22.
//
import SwiftUI
import UIKit

enum Tabs2 {
    case Welcome, Features, Start
}

struct OnboardingView: View {
    
    @State private var selectedTab: Tabs2 = .Welcome
    @State private var didTap = false
    @Binding var shouldShowOnboarding: Bool
    @Namespace private var earthNamespace
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {

                Tab(value: .Welcome) {
                    FirstPageView()
                }
                
                Tab(value: .Features) {
                    SecondPageView()
                }
                
                Tab(value: .Start) {
                    ThirdPageView(didTap: $didTap)
                }
            }
            Button {
                let haptic = UIImpactFeedbackGenerator(style: .medium)
                haptic.impactOccurred()
                shouldShowOnboarding.toggle()
                didTap.toggle()
            } label: {
                Label("Continue!", systemImage: "checkmark.circle.fill")
                    .padding(.horizontal, 30)
            }
            .customButtonStyle()
        }
        .interactiveDismissDisabled()
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
            UIPageControl.appearance().pageIndicatorTintColor = .systemIndigo.withAlphaComponent(0.5)
        }
    }
}

extension View {
    
    func customButtonStyle() -> some View {
        
        self
            .buttonStyle(.glassProminent)
            .buttonBorderShape(.capsule)
            .tint(.indigo)
            .controlSize(.large)
            .padding()
    }
}

#Preview {
//    ContentView()
    OnboardingView(shouldShowOnboarding: .constant(true))
}

