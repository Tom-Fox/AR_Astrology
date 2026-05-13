//
//  SearchView.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/19.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            List{
                Text("Search a Xiu")
            }
            .navigationTitle("Search")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    AppTabView()
}
