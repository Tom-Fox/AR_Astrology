//
//  Xiu3DView.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/10.
//

import SwiftUI
import RealityKit


struct Xiu3DView: View {
    
    @Binding var xiuName: String
    @Binding var xiuDescription: String
    @Binding var selectedXiu: String
    @Binding var sheetVisible: Bool
    
    @State private var model: ModelEntity?
    @State private var yaw: Float = 0        // 实时角
    @State private var yawBase: Float = 0    // 累计基准
    @State private var isAnimatingBack = false
    
    var canRotate: Bool
    
    var body: some View {
        
        let drag = DragGesture(minimumDistance: 8)
            .onChanged { value in
                guard canRotate else { return }
                guard abs(value.translation.width) > abs(value.translation.height) else { return }
                yaw = yawBase + Float(value.translation.width) * 0.01   // 调整 0.01 控制灵敏度
            }
            .onEnded { value in
                guard canRotate else { return }
                guard abs(value.translation.width) > abs(value.translation.height) else { return }
                yawBase += Float(value.translation.width) * 0.01
            }
        
        NavigationStack {
            
            VStack {
                
                if canRotate {
                    Text(xiuName)
                        .font(.custom("HiraMinProN-W6", size: 25, relativeTo: .title))
                        .foregroundColor(Color(.systemIndigo))
                        .transition(.opacity)
                }
                
                
                RealityView { content in
                    
                    // 加载模型
                    if let m = try? await ModelEntity(named: selectedXiu) {
                        m.name = "xiuModel"
                        m.scale = .init(repeating: 0.8)
                        content.add(m)
                        self.model = m
                    }
                } update: { _ in
                    
                    // 动画中 / 不可旋转时，不去覆盖 RealityKit 的动画
                    guard let m = model, !isAnimatingBack, canRotate else { return }
                    m.transform.rotation = simd_quatf(angle: yaw, axis: SIMD3<Float>(0, 1, 0))
                }
                .contentShape(Rectangle())
                .id(selectedXiu)   // 切换资源时强制重建以重新加载
                // 只有允许旋转时才挂手势，减少与 sheet 的冲突
                .navigationTitle("Explore 3D Details")
                .navigationBarTitleDisplayMode(.inline)
                .overlay {
                    if canRotate {
                        Color.clear
                            .contentShape(Rectangle())
                            .highPriorityGesture(drag)
                    }
                }
                
                if canRotate {
                    Text(xiuDescription)
                        .font(.custom("HiraMinProN-W6", size: 15, relativeTo: .title))
                        .multilineTextAlignment(.center)
                        .lineSpacing(3)
                        .foregroundColor(Color(.systemIndigo))
                        .padding()
                        .padding(.horizontal, 50)
                        .transition(.opacity)
                    
                    Button {

                    } label: {
                        Label("Sammy!", systemImage: "arkit")
                            .padding(.horizontal, 30)
                    }
                    .customButtonStyle()
                }
            }
            .animation(.easeInOut(duration: 0.2), value: canRotate)

        }
        .onChange(of: canRotate, initial: false) { was, isNow in
            // 从 .large -> .medium 时，平滑复位到 yaw = 0
            if was, !isNow { animateBackToZeroYaw() }
        }
        .onChange(of: selectedXiu, initial: false) { _, _ in
            yaw = 0
            yawBase = 0
        }
    }
    
    // 平滑复位动画（yaw=0）
    private func animateBackToZeroYaw(duration: TimeInterval = 0.5) {
        guard let m = model else { return }
        isAnimatingBack = true
        
        var target = m.transform
        target.rotation = simd_quatf(angle: 0, axis: SIMD3<Float>(0, 1, 0))
        
        m.move(
            to: target,
            relativeTo: m.parent,
            duration: duration,
            timingFunction: .easeInOut
        )
        
        // 动画结束后同步状态并解锁
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
            yaw = 0
            yawBase = 0
            isAnimatingBack = false
        }
    }
}



#Preview() {
    Xiu3DView(
        xiuName: .constant("角木蛟"),
        xiuDescription:  .constant("""
                                    春の兆し、木気の蛟が角で夜を裂き、播き時を告げる。
                                    Wood-born jiaolong splits the night with its horn—spring’s sowing call.
                                    """),
        selectedXiu: .constant("jiao-mu-jiao"),
        sheetVisible: .constant(true),
        canRotate: true
    )
}
