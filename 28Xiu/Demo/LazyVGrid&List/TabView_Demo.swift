//
//  TabView_Demo.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/8.
//

import SwiftUI

struct TabView_Demo: View {
    
    var body: some View {
        
        TabView {
            Tab("Requests", systemImage: "paperplane") {
                SecondTabView()
            }


            Tab("Account", systemImage: "person.crop.circle.fill") {
                SecondTabView()
            }


            TabSection("Messages") {
                Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                    SecondTabView()
                }


                Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                    SecondTabView()
                }


                Tab("Drafts", systemImage: "pencil") {
                    SecondTabView()
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
    
}

#Preview {
    TabView_Demo()
}
