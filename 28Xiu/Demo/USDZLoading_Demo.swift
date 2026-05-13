//
//  USDZLoading.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/10.
//

import SwiftUI
import RealityKit

struct USDZLoading: View {
    
    @State private var model: ModelEntity?
    @State private var yaw: Float = 0
    @State private var yawBase: Float = 0

    @Binding var selectedXiu: String

    var body: some View {
        let drag = DragGesture(minimumDistance: 0)
            .onChanged { value in
                yaw = yawBase + Float(value.translation.width) * 0.01  // 灵敏度可调
            }
            .onEnded { value in
                yawBase += Float(value.translation.width) * 0.01
            }

        NavigationStack {
            ZStack {
                RealityView { content in
                    if let m = try? await ModelEntity(named: selectedXiu) {
                        m.name = "xiuModel"
                        m.scale = [0.8, 0.8, 0.8]
                        content.add(m)
                        self.model = m            // 记得存起来，update 才能拿到
                    }
                } update: { _ in
                    if let m = model {
                        //  用 Y 轴旋转，零轴是无效的
                        m.transform.rotation = simd_quatf(angle: yaw, axis: [0, 1, 0])
                    }
                }
                .gesture(drag)
                .contentShape(Rectangle()) // 让整个区域都吃到拖拽
                .id(selectedXiu)           // 当切换模型名时强制重建并重新加载
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview() {
    USDZLoading(
        selectedXiu: .constant("jiao-mu-jiao")
    )
}
