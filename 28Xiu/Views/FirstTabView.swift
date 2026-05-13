//
//  Untitled.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/19.
//

import SwiftUI

struct FirstTabView: View {
    
    var body: some View {
        ZStack {
            
            Image("indigoGalaxy3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            
            RotatingEarthView()

        }
    }
}


#Preview {
    FirstTabView()
}
