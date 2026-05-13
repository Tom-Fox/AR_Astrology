//
//  ListImageView_Demo.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/8.
//

import SwiftUI

struct ListImageView_Demo: View {
    
    @Binding var selectedXiu: String
    @Binding var sheetVisible: Bool
    
    var body: some View {
        
        NavigationStack {
            
            Image(selectedXiu)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .overlay(){
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.indigo, lineWidth: 3)
                        .opacity(0.5)
                }
                .padding()
                .navigationTitle("Detail")
                .navigationBarTitleDisplayMode(.inline)
            
//                .toolbar {
//                    ToolbarItem(placement: .topBarTrailing) {
//                        Button {
//                            sheetVisible.toggle()
//                        } label: {
//                            Image(systemName: "xmark")
//                                .imageScale(.medium)
//                        }
//                        .buttonStyle(.glassProminent)
//                        .tint(.indigo)
//                    }
//                }
//
            
                // Force the navigation bar to use a dark color scheme so its foreground (title and bar button items) renders with light colors for better contrast over dark backgrounds.
                .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    ListImageView_Demo(selectedXiu: Binding.constant("jiao-mu-jiao"), sheetVisible: Binding.constant(true))
}


