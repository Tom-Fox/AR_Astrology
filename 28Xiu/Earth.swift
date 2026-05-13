//
//  Earth.swift
//  28Xiu
//
//  Created by S@mmy on 2025/9/27.
//

import SwiftUI
import RealityKit

struct Earth: View {
    
    var body: some View {
        
        RealityView { content in
            
            let sphere = MeshResource.generateSphere(radius: 0.7)
            
            var material = PhysicallyBasedMaterial()
            material.baseColor.tint = .blue
            
            let earth = ModelEntity(mesh: sphere, materials: [material])
            
            Task {
                if let texture = try? await TextureResource(named: "2k_earth_daymap") {
                    var textured = PhysicallyBasedMaterial()
                    textured.baseColor.texture = .init(texture)
                    await MainActor.run {
                        earth.model?.materials = [textured]
                    }
                }
            }
            
            let root = Entity()
            root.addChild(earth)
            content.add(root)
            
            let camera = PerspectiveCamera()
            camera.transform.translation = [0, 0, 2.0] // 往后一点看球
            root.addChild(camera)
            
        }
        
    
    }
}


#Preview {
    Earth()
}
