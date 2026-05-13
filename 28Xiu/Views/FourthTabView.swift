//
//  FourthTabView.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/19.
//

import SwiftUI

struct FourthTabView: View {
    @State private var birthDirect: String = ""
    @State private var todayDirect: String = ""

    var body: some View {
        FourthTabRoot(birthDirect: $birthDirect, todayDirect: todayDirect)
    }
}

#Preview {
    FourthTabView()
}
