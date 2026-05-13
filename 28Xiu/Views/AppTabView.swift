//
//  TabViewTest.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/19.
//
import SwiftUI

enum Tabs {
    case home, today, ar, divination, search
}

struct AppTabView: View {

    @State private var selectedTab: Tabs = .home
    @State private var rainbowPlay = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            Tab("28Xiu", systemImage: "moon.stars.fill", value: .home) {
                FirstTabView()
            }
            
            Tab("Today", systemImage: "star", value: .today) {
                SecondTabView()
            }
            
            Tab("AR", systemImage: "arkit", value: .ar) {
                ThirdTabView()
            }
            
            Tab("Divination", systemImage: "person.and.background.dotted", value: .divination) {
                FourthTabView()
            }
            
//            Tab(value: .search, role: .search){
//                SearchView()
//            }
        }
        .tint(.indigo)
        .onChange(of: selectedTab) { oldValue, newValue in
            guard newValue == .divination else { return }
            rainbowPlay = true
        }
    }
}



#Preview {
    AppTabView()
}

