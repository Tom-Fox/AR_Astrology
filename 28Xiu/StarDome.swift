//
//  StarDome.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/27.
//

import RealityKit
import Combine

final class StarDomeModule {
    private(set) var anchor = AnchorEntity(.camera)
    private var dome: ModelEntity?
    private weak var scene: Scene?

    private var spinCancellable: AnyCancellable?
    private(set) var isSpinning = false
    private var spinSpeed: Float = .pi/720   // 默认角速度（每秒）

    // 安装（只做一次）
    func install(on arView: ARView, textureName: String, radius: Float = 80) async throws {
        scene = arView.scene
        let mesh = MeshResource.generateSphere(radius: 96)
        let tex  = try await TextureResource.load(named: textureName)

        var mat = UnlitMaterial()
        mat.color = .init(texture: .init(tex))

        let dome = ModelEntity(mesh: mesh, materials: [mat])
        dome.scale.x = -1           // 翻法线到内侧
        dome.collision = nil
        self.dome = dome

        anchor.addChild(dome)
        arView.scene.addAnchor(anchor)

        // 若想默认开转：
        startSpinning()
    }

    // 开始自转（可改速）
    func startSpinning(speed: Float? = nil) {
        guard let scene, let _ = dome else { return }
        if let s = speed { spinSpeed = s }
        // 避免重复订阅
        spinCancellable?.cancel()
        spinCancellable = scene.publisher(for: SceneEvents.Update.self)
            .sink { [weak self] ev in
                guard let self, let dome = self.dome else { return }
                dome.orientation *= simd_quatf(
                    angle: self.spinSpeed * Float(ev.deltaTime),
                    axis: SIMD3<Float>(0, 1, 0)
                )
            }
        isSpinning = true
    }

    // 停止自转
    func stopSpinning() {
        spinCancellable?.cancel()
        spinCancellable = nil
        isSpinning = false
    }

    func toggleSpin() {
        isSpinning ? stopSpinning() : startSpinning()
    }

    // 可选：动态改速（不打断订阅）
    func setSpeed(_ speed: Float) { spinSpeed = speed }
}
