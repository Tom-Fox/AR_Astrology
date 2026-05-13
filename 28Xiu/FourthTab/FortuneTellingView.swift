//
//  FortuneTellingView.swift
//  28Xiu
//
//  Created by kumo on 2025/10/15.
//
import SwiftUI

struct FortuneTellingView: View {
    @State private var isShowingNext = false
    
    // 入场动画状态
    @State private var appeared = false
    @State private var scale: CGFloat = 0.85
    @State private var opacity: Double = 0.0
    @State var fortunes : [Fortune] = []
    @Binding var fortCombination : String
    
    @State var yourFortune : Fortune?
    @State var fortuneTitle: String = ""
    @State var fortuneTitle_kata : String = ""
    @State var fortBrief: String = ""
    @State var fortBrief_kata: String = ""
    
    @State var fortuneDesc_jp: String = ""
    @State var fortuneDesc_en: String = ""
    @State private var play: Bool = false
    
    // Local state kept if needed elsewhere
    @State private var birthDirect: String = ""
    @State private var todayDirect: String = ""
    
    var dataservice = DataService()
    
    @Environment(\.horizontalSizeClass) private var hSize
    
    private var frameHeight: CGFloat {
        hSize == .compact ? 800 : 1200
    }
    
    // 根据宽度设置字号
    private var typography: Typography {
        let hight = frameHeight
        if hight == 1200 {
            return .regular // iPad
        } else {
            return .compact // iPhone
        }
    }

    // Shared path from root
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack{
            Rectangle()
                .background {
                    Image("indigoGalaxy3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .foregroundColor(.clear)
                .ignoresSafeArea()
            VStack(spacing: 10) {
                Text(fortuneTitle)
                    .foregroundColor(.white)
                    .font(.custom("HiraMinProN-W6", size: typography.title, relativeTo: .title))
                Text(fortuneTitle_kata)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom)
                    .font(.custom("HiraMinProN-W6", size: typography.subtitle, relativeTo: .title))
                Text(briefAlignment(fortBrief))
                    .font(.custom("HiraMinProN-W6", size: typography.brief, relativeTo: .title))
                    .foregroundColor(.white)
                Text(fortBrief_kata)
                    .font(.custom("HiraMinProN-W6", size: typography.briefKana, relativeTo: .title))
                    .foregroundColor(.white.opacity(0.8))
                Divider()
                    .overlay(Color.gray)
                    .frame(width: typography.dividerWidth)
                    .padding(typography.dividerHeight)
                
                // 描述区可滚动，避免任何截断
                ScrollView {
                    VStack(spacing: 10) {
                        Text(multilineByPunctuation(fortuneDesc_jp))
                            .font(.custom("HiraMinProN-W6", size: typography.bodyJP, relativeTo: .title))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white.opacity(0.8))
                            .lineSpacing(10)
                            .padding(.horizontal)
                            .minimumScaleFactor(0.9)
                        
                        Divider()
                            .overlay(Color.gray)
                            .frame(width: typography.dividerWidth)
                            .padding(typography.dividerHeight)
                        
                        Text(multilineByPunctuation(fortuneDesc_en))
                            .font(.custom("HiraMinProN-W6", size: typography.bodyEN, relativeTo: .title))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white.opacity(0.8))
                            .lineSpacing(10)
                            .padding(.horizontal,15)
                            .minimumScaleFactor(0.9)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 4)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button {
                    // 回到 FourthTabRoot：清空路径
                    path.removeLast(path.count)
                } label: {
                    Label("Start Over", systemImage: "repeat")
                        .padding(.horizontal, 50)
                }
                .customButtonStyle()
                
            }
            .frame(height: frameHeight*0.8)
            .padding(.vertical)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(){
            fortunes = self.dataservice.getFortuneData()
//            print("Loaded fortunes count:", fortunes.count)
            updateFor(comb: fortCombination)
        }
    }
    
    private func playAppearAnimation() {
        withAnimation(.easeOut(duration: 0.5)) {
            opacity = 1.0
        }
        withAnimation(.spring(response: 1.6, dampingFraction: 0.9)) {
            scale = 1.0
            appeared = true
        }
    }
    private func updateFor(comb: String) {
        yourFortune = FortuneTelling.findFortune(byCombination: fortCombination, in: fortunes)
        
        fortuneTitle = yourFortune?.title ?? "-"
        fortuneTitle_kata = yourFortune?.title_kata ?? "-"
        fortBrief = yourFortune?.brief ?? "-"
        fortBrief_kata = yourFortune?.brief_kata ?? "-"
        fortuneDesc_jp = yourFortune?.discription_jp ?? "-"
        fortuneDesc_en = yourFortune?.discription_en ?? "-"
    }
    
    private func briefAlignment(_ text: String) -> String {
        var alignedLine = String()
        for (idx, ch) in text.enumerated() {
            alignedLine.append(ch)
            if idx == 8 { continue }
            alignedLine.append("  ")
            if idx == 3 {
                alignedLine.append(" ")
            }
        }
        return alignedLine
    }
    
    // 若s1以"."或"。"结尾，强制换行，不与s2合并；
    // 否则考虑合并s1与s2，英文用空格拼接，非英文直接拼接；
    private func multilineByPunctuation(_ text: String) -> String {
        let delimiters: Set<Character> = ["、", "。", ",", ".", ";"]
        // 收集句子（包含末尾标点）
        var sentences: [String] = []
        var current = String()
        for ch in text {
            current.append(ch)
            if delimiters.contains(ch) {
                let trimmed = current.trimmingCharacters(in: .whitespacesAndNewlines)
                if !trimmed.isEmpty {
                    sentences.append(trimmed)
                }
                current.removeAll(keepingCapacity: true)
            }
        }
        let tail = current.trimmingCharacters(in: .whitespacesAndNewlines)
        if !tail.isEmpty {
            sentences.append(tail)
        }
        
        // 组装行：按新合并规则处理
        var lines: [String] = []
        var i = 0
        while i < sentences.count {
            let s1 = sentences[i]
            
            // 若 s1 以 "." 或 "。" 结尾，则强制换行，不能与下一句合并
            if let last = s1.last, last == "." || last == "。" {
                lines.append(s1)
                i += 1
                continue
            }
            
            // 考虑与下一句合并
            if i + 1 < sentences.count {
                let s2 = sentences[i + 1]
                
                // 先以英文模式预拼接，判断是否全 ASCII
                let englishCandidate = s1 + " " + s2
                if isEnglishSentence(englishCandidate) {
                    if englishCandidate.count <= 38 {
                        lines.append(englishCandidate) // 英文：带空格
                        i += 2
                        continue
                    }
                } else {
                    // 非英文：不加空格直接拼接
                    let nonEnglishCombined = s1 + s2
                    if nonEnglishCombined.count <= 16 {
                        lines.append(nonEnglishCombined)
                        i += 2
                        continue
                    }
                }
            }
            // 单独成行
            lines.append(s1)
            i += 1
        }
        
        return lines.joined(separator: "\n")
    }
    
    // 简单判定“英文句子”：全部为 ASCII 可打印字符
    private func isEnglishSentence(_ s: String) -> Bool {
        for scalar in s.unicodeScalars {
            if !(scalar.value >= 32 && scalar.value <= 126) {
                return false
            }
        }
        return true
    }
}

// 一处集中管理的字号表
private struct Typography {
    let title: CGFloat
    let subtitle: CGFloat
    let dividerWidth: CGFloat
    let dividerHeight: CGFloat
    let brief: CGFloat
    let briefKana: CGFloat
    let bodyJP: CGFloat
    let bodyEN: CGFloat
    
    // 三档：紧凑 / 中等 / 常规（更大屏）
    static let compact = Typography(
        title: 25,
        subtitle: 15,
        dividerWidth: 330,
        dividerHeight: .leastNormalMagnitude,
        brief: 20,
        briefKana: 16,
        bodyJP: 16,
        bodyEN: 16
    )

    static let regular = Typography(
        title: 40,
        subtitle: 20,
        dividerWidth: 560,
        dividerHeight: 20,
        brief: 22,
        briefKana: 18,
        bodyJP: 20,
        bodyEN: 20
    )
}

#Preview {
    FortuneTellingView(
        fortCombination: .constant("WN"),
        path: .constant(NavigationPath())
    )
}
