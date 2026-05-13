//
//  GoTo.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/12.
//

import SwiftUI

struct GoToOtherApp: View {
    var body: some View {

        
        // Create URL instance based on URL scheme
        if let url = URL(string: "maps://?q=Mexican+Restaurant&sll=50.894967,4.341626&z=10&t=s"){
            
            // Test if URL can be opened
            if UIApplication.shared.canOpenURL(url) {
                
                Button {
                    // Open the URL
                    UIApplication.shared.open(url)
                } label:  {
                    Label("Go To Map!", systemImage: "app.connected.to.app.below.fill")
                        .padding(.horizontal, 30)
                }
                .customButtonStyle()
                
            }
        }

    }
    
}

#Preview {
    GoToOtherApp()
}
