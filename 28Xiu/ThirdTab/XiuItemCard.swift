//
//  XiuItemCard.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/9.
//

import SwiftUI

struct XiuItemCard: View {
    
    var name: String
    var mansionName: String
    var imageName: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.indigo)
                .cornerRadius(20)
                .blur(radius: 10)
            
            Rectangle()
                .background {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .foregroundColor(.clear)
                .cornerRadius(20)
            
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(.black)
                .opacity(0.3)
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text(name)
                        .font(.custom("HiraMinProN-W6", size: 25, relativeTo: .title))
                    Spacer()
                    
                    Text(mansionName)
                        .font(.custom("HiraMinProN-W6", size: 20, relativeTo: .title))
                    
                }
                .padding()
                .foregroundColor(.white)
                
                Spacer()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
        .padding(.horizontal, 9)
    }
    
}

#Preview {
    XiuItemCard(name:"角木蛟", mansionName: "角", imageName: "jiao-mu-jiao")
}
