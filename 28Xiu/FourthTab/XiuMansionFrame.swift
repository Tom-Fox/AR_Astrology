//
//  XiuMansionFrame.swift
//  28Xiu
//
//  Created by kumo on 2025/10/13.
//

import SwiftUI

struct XiuMansionFrame: View {
    
    @Binding var backImageName: String
    @Binding var xiuName: String
    @Binding var mansionName: String

    @Binding var imageName: String
    @Binding var discription: String

    // 入场动画状态
    @State private var appeared = false
    @State private var scale: CGFloat = 0.85
    @State private var opacity: Double = 0.0

    // Computed color derived from imageName; no @State
    var discFontColor: Color {
        switch backImageName {
        case "indigoGalaxy3":
            return Color.gray
        case "indigoGalaxy_reverse":
            return Color.black.opacity(0.8)
        default:
            return Color.primary
        }
    }
    
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    // 将图片从 background 移出，直接对 Image 做 overlay
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.indigo, lineWidth: 10)
                                .blur(radius:10)
                        )
                        .padding()
                }
                // 渐入 + 从小变大
                .scaleEffect(scale)
                .opacity(opacity)
                .onAppear {
                    playAppearAnimation()
                }
                Text(xiuName)
                    .font(.custom("HiraMinProN-W6", size: 28, relativeTo: .largeTitle))
                    .foregroundColor(.indigo)
                    .multilineTextAlignment(.center)
                    .padding(.leastNormalMagnitude)
                Text("\(mansionName)")
                    .font(.custom("HiraMinProN-W6", size: 20, relativeTo: .largeTitle))
                    .foregroundColor(.indigo)
                    .foregroundColor(discFontColor)
                    .multilineTextAlignment(.center)
                    .frame(alignment: .center)
                    .padding()
                Text(discription)
                    .font(.custom("HiraMinProN-W6", size: 20, relativeTo: .largeTitle))
                    .foregroundColor(discFontColor)
                    .multilineTextAlignment(.center)
                    .padding(.leastNormalMagnitude)
            }
        }
        // 当图片切换时，重播入场动画
        .onChange(of: imageName) { _, _ in
            resetAppearAnimation()
            playAppearAnimation()
        }
    }

    private func resetAppearAnimation() {
        appeared = false
        scale = 0.5
        opacity = 0.0
    }

    private func playAppearAnimation() {
        // 先淡入
        withAnimation(.easeOut(duration: 0.5)) {
            opacity = 1.0
        }
        // 再从小变大到 1.0
        withAnimation(.spring(response: 1.6, dampingFraction: 0.9)) {
            scale = 1.0
            appeared = true
        }
    }
}

#Preview {
    XiuMansionFrame(
        backImageName: .constant(""),
        xiuName: .constant("角｜Horn"),
        mansionName: .constant("東方青龍\nAzure Dragon of the East"),
        imageName: .constant("jiao-mu-jiao"),
        discription:.constant("春の兆し、木気の蛟が角で夜を裂き、播き時を告げる。\nWood-born jiaolong splits the night with its horn—spring’s sowing call."),
    )
}
