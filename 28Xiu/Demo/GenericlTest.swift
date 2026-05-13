//
//  Test.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/8.
//

import SwiftUI
import UIKit

struct Test1: View {
    var body: some View {
        NavigationStack {
            ScrollView {                         // 必须是可滚动的视图
                VStack(spacing: 16) {
                    ForEach(0..<40) { i in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.blue.opacity(0.15))
                            .frame(height: 72)
                            .overlay(Text("Row \(i)"))
                    }
                }
                .padding()
            }
            .navigationTitle("28Xiu")            // 这些要挂在 ScrollView 上
            .navigationBarTitleDisplayMode(.large)
            .scrollEdgeEffectStyle(.soft, for: [.top, .bottom])
        }
    }
}

struct SheetExample: View {
    @State private var show = false

    var body: some View {
        Button("Show Sheet") { show.toggle() }
            .sheet(isPresented: $show) {
                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.indigo.opacity(0.2))
                        .frame(height: 200)
                        .padding()
                    Text("Drag me up or down 👆👇")
                        .font(.headline)
                }
                .frame(maxHeight: .infinity)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }
    }
}



func dumpAvailableFonts() {
    for family in UIFont.familyNames.sorted() {
        let names = UIFont.fontNames(forFamilyName: family)
        print("Family: \(family) -> \(names)")
    }
}


#Preview {
    SheetExample()
}
