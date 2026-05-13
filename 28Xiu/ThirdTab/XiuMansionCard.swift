//
//  XiuMansionCard.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/9.
//

import SwiftUI

struct XiuMansionCard: View {
    
    var name: String
    var imageName: String
    var summary: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.indigo)
                .cornerRadius(20)
                .blur(radius: 10)
            
            Rectangle()
                .background {
                    Image("indigoGalaxy3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .foregroundColor(.clear)
                .cornerRadius(20)
            
            Rectangle()
                .background {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .foregroundColor(.clear)
                .padding()
            
            VStack(alignment: .leading) {
                
                Text(name)
                        .font(.custom("HiraMinProN-W6", size: 20, relativeTo: .title))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 5)
                
                Spacer()
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.black)
                        .blur(radius: 20)

                    
                    VStack(alignment: .leading) {
                        Spacer()
                        HStack {
                            Text(summary)
                                .font(.custom("HiraMinProN-W6", size: 11, relativeTo: .title))
                                .lineSpacing(3) 
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                }
                .frame(height: 120)
                    
            }
            .padding()
            .foregroundColor(.white)

                    
        }
        .frame(height: 500)
        .padding(.horizontal)
        
    }
    
}

#Preview {
    XiuMansionCard(
        name:"""
Azure Dragon of the East

東方青龍
""",
                        imageName: "Azure-Dragon-of-the-East",
                        summary: """
 • 青竜（せいりゅう／しょうりゅう、pinyin: Qīnglóng）
四神の一つ。東と春を司り、五行は木。青緑の龍として表される。

 • Azure Dragon (青龍; pinyin: Qīnglóng)
One of the Four Symbols. Represents the east and the spring; in Wuxing it corresponds to Wood. Depicted as a blue-green dragon.

""")
}
