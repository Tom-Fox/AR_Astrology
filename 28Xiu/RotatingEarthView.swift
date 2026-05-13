//
//  Page1.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/22.
//

import SwiftUI
import RealityKit

struct RotatingEarthView: View {
    
    var body: some View {
        ZStack {
            
            Ellipse()
                .fill(Color.black.opacity(0.75))
                .frame(width: 300, height: 300)
                .blur(radius: 20)
            
            RealityView { content in
                
                // 1) 创建球体网格
                let sphere = MeshResource.generateSphere(radius: 0.7)
                
                // 2) 创建材质并加载贴图（先用纯色占位，异步加载贴图）
                var material = PhysicallyBasedMaterial()
                material.baseColor.tint = .blue
                
                let earth = ModelEntity(mesh: sphere, materials: [material])
                
                
                // 异步加载贴图，避免阻塞主线程
                Task {
                    if let texture = try? await TextureResource(named: "2k_earth_daymap") {
                        var textured = PhysicallyBasedMaterial()
                        textured.baseColor.texture = .init(texture)
                        await MainActor.run {
                            earth.model?.materials = [textured]
                        }
                    }
                }
                
                // 3) 初始朝向（地球倾角可选）
                earth.transform.rotation = simd_quatf(angle: .pi / 12, axis: [1, 0, 0])
                
                // 4) 放进场景
                let root = Entity()
                root.addChild(earth)
                content.add(root)
                
                // 5) 添加一个简单光照（可选）true
                let light = DirectionalLight()
                light.light.intensity = 1500
                light.light.color = .white
                light.look(at: .zero, from: [2, 2, 2], relativeTo: nil)
                root.addChild(light)
                
                
                // 6) 相机（非 AR 的观察视角）
                let camera = PerspectiveCamera()
                camera.transform.translation = [0, 0, 2.0] // 往后一点看球
                root.addChild(camera)
                
                // 7) 无限自转动画（Y 轴）
                Task { @MainActor [weak earth] in
                    guard let earth else { return }
                    while true {
                        let current = earth.transform
                        var next = current
                        next.rotation *= simd_quatf(angle: .pi, axis: [0, 1, 0])
                        // 半圈 5 秒，线性匀速
                        earth.move(
                            to: next,
                            relativeTo: nil,
                            duration: 15.0,
                            timingFunction: .linear
                        )
                        // Pace the loop to match the animation duration and avoid enqueuing infinite animations immediately
                        do {
                            try await Task.sleep(nanoseconds: 5_000_000_000)
                        } catch {
                            // Exit the loop if the task is cancelled
                            break
                        }
                    }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .clipped()
            .frame(width: 400, height: 400)
        }
        

    }
}

#Preview {
//    ContentView()
    RotatingEarthView()
}
