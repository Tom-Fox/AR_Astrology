//
//  ComparisonSheet .swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/22.
//

import SwiftUI

enum Tabs3 {
    case BirthXiu, TodaysXiu
}

public struct ComparisonSheet: View {
    
    @State private var selectedTab: Tabs3 = .BirthXiu
    @Binding var showSheet: Bool
    @Binding var isShowingNextView: Bool
    @Binding var birthDate : Date
    @Binding var birthDirect: String
    @Binding var todayDirect: String
    
    public var body: some View {
        
        TabView(selection: $selectedTab) {
            
            Tab(value: .BirthXiu) {
                BirthXiu(birthDate: $birthDate, birthDirect: $birthDirect)
            }
            
            Tab(value: .TodaysXiu) {
                TodaysXiu(todayDirect: $todayDirect)
            }
        }
        .ignoresSafeArea()
        .interactiveDismissDisabled()
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
            UIPageControl.appearance().pageIndicatorTintColor = .systemIndigo.withAlphaComponent(0.5)
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                showSheet.toggle( )
                isShowingNextView.toggle( )
            } label: {
                Label("Continue!", systemImage: "checkmark.circle.fill")
                    .padding(.horizontal, 50)
            }
            .customButtonStyle()
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    ComparisonSheet(showSheet: .constant(true),
                    isShowingNextView: .constant(true),
                    birthDate: .constant(Date()),
                    birthDirect: .constant("-"),
                    todayDirect: .constant("-")
                    )
}

