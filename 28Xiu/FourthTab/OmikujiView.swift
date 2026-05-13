//
//  OmikujiView.swift
//  28Xiu
//
//  Created by kumo on 2025/10/15.
//

import SwiftUI
import UIKit

struct OmikujiView: View {
    
    @State private var isShowingDetailView = false
    @State var backImageName = "indigoGalaxy3"
    @State private var omikujiResult: String = ""
    @State var imageName: String = ""
    
    @Binding var birthDirect: String
    @Binding var todayDirect: String
    @State var fortComb: String = "-"
    // 入场动画控制
    @State private var appeared: Bool = false        // 仅用于淡入
    @State private var spinDegrees: Double = 0       // 3D 自转角度
    @State private var scale: CGFloat = 0.85         // 初始略小，转完后放大到 1.0
    var dataservice = DataService()
    
    @Environment(\.horizontalSizeClass) private var hSize
    
    private var frameHeight: CGFloat {
        hSize == .compact ? 800 : 1200
    }

    // Shared NavigationPath from root
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack{
            Rectangle()
                .background {
                    Image(backImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .foregroundColor(.clear)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text(fortComb)
                    .font(.custom("HiraMinProN-W6", size: 28, relativeTo: .largeTitle))
                Rectangle()
                    .background {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            // 出场：先淡入，再在自转结束后放大到 1.0
                            .scaleEffect(scale)
                            .opacity(appeared ? 1.0 : 0.0)
                            // 3D 绕竖轴自转（一次 360° 后停止），加一点透视
                            .rotation3DEffect(
                                .degrees(spinDegrees),
                                axis: (x: 0, y: 1, z: 0),
                                perspective: 0.6
                            )
                            // 触发动画
                            .onAppear {
                                // 1) 淡入
                                withAnimation(.easeOut(duration: 2.0)) {
                                    appeared = true
                                }
                                // 2) 自转一圈（保持略小的 scale）
                                let spinDuration = 2.0
                                withAnimation(.easeInOut(duration: spinDuration)) {
                                    spinDegrees = 720
                                }
                                // 3) 自转结束后再放大到 1.0
                                DispatchQueue.main.asyncAfter(deadline: .now() + spinDuration) {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.9)) {
                                        scale = 1.0
                                    }
                                }
                            }
                    }
                    .frame(height: frameHeight*0.6)
                    .foregroundColor(.clear)
                
                Button {
                    // 使用路径路由进入 Fortune
                    path.append(DivinationRoute.fortune(fortComb))
                } label: {
                    Label("Details", systemImage: "sparkle.text.clipboard.fill")
                        .padding(.horizontal, 60)
                }
                .customButtonStyle()
                
            }
            .padding()
            .navigationTitle("Your 28 Xiu is")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(){
            if birthDirect != "" && todayDirect != "" {
                fortComb = birthDirect + todayDirect
                print("fortComb: \(fortComb)")
            }
            else { print("direction missing") }
            
            // Validate that fortComb is exactly two characters from E/W/S/N
            let isValid = NSPredicate(format: "SELF MATCHES %@", "[EWSN][EWSN]").evaluate(with: fortComb)
            if isValid {
                imageName = fortComb
                print("imageName: \(imageName)")
            } else {
                print("invalid imageName")
            }
        }
    }
}

#Preview {
    OmikujiView(
        imageName: "EE", birthDirect: .constant("E"),todayDirect: .constant("S"),
        path: .constant(NavigationPath())
    )
}
