//
//  XiuItemView.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/9.
//

import SwiftUI

struct XiuMansionView: View {
    
    //    var mansions = [XiuMansion1]()
    @State var mansions: [XiuMansion] = []
    
    var dataService = DataService()
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                ForEach(mansions) { mansion in
                    
                    NavigationLink {
                        XiuItemView(xius: mansion.xius,
                                    xiusMansionNames: mansion.name)
                    } label: {
                        XiuMansionCard(
                            name:mansion.name,
                            imageName: mansion.imageName,
                            summary: mansion.summary
                        )
                        .padding(.bottom)
                    }
                    
                }
            }
            .navigationTitle("28Xiu")
        }
        .onAppear {
            mansions = self.dataService.getXiuData()
        }
    }
    
    
}

#Preview {
    XiuMansionView()
}
