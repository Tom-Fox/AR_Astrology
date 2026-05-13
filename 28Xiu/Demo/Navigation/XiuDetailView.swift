//
//  XiuDetail.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/9.
//

import SwiftUI

struct XiuDetail: View {
    
    var xiuName: String
    var xiuDescription: String
    var xiuImage: String
    
    var body: some View {
        
        ScrollView {
           
            VStack {
                
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("scroll")).minY
                    let extra = max(0, minY)
                    let baseHeight: CGFloat = 500
                    let height = baseHeight + extra

                    Image(xiuImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width, height: height, alignment: .top)
                        .clipped()
                        .offset(y: minY > 0 ? -minY : 0)
                        .blur(radius: min(max(0, extra / 50), 8))

                }
                .frame(height: 500)
                
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text(xiuName)
                        .font(.custom("HiraMinProN-W3", size: 25, relativeTo: .title))
                    
                    Text(xiuDescription)
                        .font(.custom("HiraMinProN-W3", size: 16, relativeTo: .title))
                    
                }
                
            }
        }
        .coordinateSpace(name: "scroll")
        .ignoresSafeArea()
    }
}

#Preview {
    XiuDetail(xiuName:"角木蛟", xiuDescription: "角木蛟", xiuImage: "jiao-mu-jiao")
}
