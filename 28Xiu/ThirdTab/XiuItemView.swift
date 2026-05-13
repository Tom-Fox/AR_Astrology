//
//  XiuItemView.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/9.
//

import SwiftUI

struct XiuItemView: View {
    
    @State var sheetVisible = false
    @State var selectedXiu = ""
    @State var selectedXiuName = ""
    @State var selectedXiuDescription = ""
    @State private var detent: PresentationDetent = .medium
    
    var xius: [XiuItem]
    var xiusMansionNames: String
    
    @Environment(\.horizontalSizeClass) private var hSize
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                var columns: [GridItem] {
                    if hSize == .compact {
                        return Array(repeating: GridItem(.flexible()), count: 2)
                    } else {
                        return Array(repeating: GridItem(.flexible()), count: 3)
                    }
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(xius) { xiu in
                        
                        XiuItemCard(name: xiu.name,
                                    mansionName: xiu.mansionName,
                                    imageName: xiu.imageName
                        )
                        .onTapGesture {
                            sheetVisible.toggle()
                            selectedXiu = xiu.imageName
                            selectedXiuName = xiu.name
                            selectedXiuDescription = xiu.description
                        }
                        
                    }
                }
                .padding(.horizontal, 15)
            }
            .navigationTitle(xiusMansionNames)
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $sheetVisible) {
            Xiu3DView(
                xiuName: $selectedXiuName,
                xiuDescription: $selectedXiuDescription,
                selectedXiu: $selectedXiu,
                sheetVisible: $sheetVisible,
                canRotate: detent == .large
            )
            .presentationDetents([.medium, .large], selection: $detent)
            .presentationDragIndicator(.visible)
        }
        // && 与 的时候执行
        .onChange(of: sheetVisible, initial: false) { was, isNow in
            if !was, isNow { detent = .medium }
        }
        
    }
}

#Preview {
    XiuItemView(xius: [
        XiuItem(name: "角木蛟", mansionName: "角", imageName: "jiao-mu-jiao", modelName:"jiao-mu-jiao", description: "角木蛟 jiao-mu-jiao"),
        XiuItem(name: "亢金龙", mansionName: "亢", imageName: "kang-jin-long", modelName:"kang-jin-long", description: "亢金龙 kang-jin-long"),
        XiuItem(name: "氐土貉", mansionName: "氐", imageName: "di-tu-hao", modelName:"di-tu-hao", description: "角木蛟 jiao-mu-jiao"),
        XiuItem(name: "房日兔", mansionName: "房", imageName: "fang-ri-tu", modelName:"fang-ri-tu", description: "角木蛟 jiao-mu-jiao"),
        XiuItem(name: "心月狐", mansionName: "心", imageName: "xin-yue-hu", modelName:"xin-yue-hu", description: "角木蛟 jiao-mu-jiao"),
        XiuItem(name: "尾火虎", mansionName: "尾", imageName: "wei-huo-hu", modelName:"wei-huo-hu", description: "角木蛟 jiao-mu-jiao"),
        XiuItem(name: "箕水豹", mansionName: "箕", imageName: "ji-shui-bao", modelName:"ji-shui-bao", description: "角木蛟 jiao-mu-jiao")
    ], xiusMansionNames:"""
Azure Dragon of the East

東方青龍
""")
}
