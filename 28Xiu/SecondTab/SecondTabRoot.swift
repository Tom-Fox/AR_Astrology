//
//  SencondTabRoot.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/12.
//

import SwiftUI
import RealityKit

struct SecondTabRoot: View {
    
    @State var lunarMonths: [LunarMonth] = []
    @State var mansions: [XiuMansion] = []
    @State var todayXiuName: String = ""
    @State var todayXiuItem: XiuItem?
    @State var todayXiuMansion: XiuMansion?
    @State private var model: ModelEntity?
    
    @State private var selectedDate = Date()
    
    @State var lunarMonthName: String = ""
    @State var lunarDayName: String = ""
    
    var dataService = DataService()
    
    @Environment(\.horizontalSizeClass) private var hSize
    
    private var frameHeight: CGFloat {
        hSize == .compact ? 800 : 1200
    }
    
    
    @State private var yawBase: Float = 0
    @State private var isAnimatingBack = false
    
    var body: some View {
        
        let drag = DragGesture(minimumDistance: 8)
            .onChanged { value in
                let currentYaw = yawBase + Float(value.translation.width) * 0.01
                
                model?.transform.rotation = simd_quatf(angle: currentYaw, axis: SIMD3<Float>(0, 1, 0))
            }
            .onEnded { value in
                yawBase += Float(value.translation.width) * 0.01
            }
        
        ZStack {
            Rectangle()
                .background {
                    Image("indigoGalaxy3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .foregroundColor(.clear)
            
            VStack {
                ZStack {
                    
                    Image(todayXiuMansion?.imageName ?? "—")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, 30)
                }
                Spacer()
            }
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .blur(radius: 20)
                        .frame(width: 210, height: 110)
                    VStack {
                        Text(headerText)
                            .foregroundColor(.yellow)
                        Text(lunarMonthName)
                            .foregroundColor(.white)
                        Text(lunarDayName)
                            .foregroundColor(.white)
                    }
                    .font(.custom("HiraMinProN-W6", size: 16, relativeTo: .title))
                }
                .padding(.top, 80)
                Spacer()
            }
            
            RealityView { content in
                
                if let modelName = todayXiuItem?.modelName,
                   let m = try? await ModelEntity(named: modelName) {
                    
                    m.name = "xiuModel"
                    
                    let finalRotation = simd_quatf(angle: 0, axis: SIMD3<Float>(0, 1, 0))
                    let finalTransform = Transform(
                        scale: SIMD3<Float>(repeating: 0.8),
                        rotation: finalRotation,
                        translation: SIMD3<Float>(0, 0, 0)
                    )
                    
                    let initialTransform = Transform(
                        scale: SIMD3<Float>(repeating: 0.01),
                        rotation: simd_quatf(angle: 60, axis: SIMD3<Float>(0, 1, 0)),
                        translation: SIMD3<Float>(0, -0.5, 0)
                    )
                    m.transform = initialTransform
                    
                    content.add(m)
                    self.model = m
                    
                    m.move(to: finalTransform, relativeTo: m.parent, duration: 1, timingFunction: .easeOut)
                }
            }
            .frame(height: frameHeight)
            .id(todayXiuItem?.modelName)
            .gesture(drag)
            
            VStack {
                Spacer()
                HStack {
                    Button {
                        changeDate(by: -1)
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                    }
                    .buttonStyle(.glassProminent)
                    .buttonBorderShape(.circle)
                    .tint(.indigo)
                    .controlSize(.large)
                    .padding()
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .blur(radius: 30)
                            .frame(width: 200, height: 100)
                        
                        VStack {
                            Text(todayXiuName)
                            Text(todayXiuItem?.name ?? "—")
                        }
                        .font(.custom("HiraMinProN-W6", size: 25, relativeTo: .title))
                        .foregroundColor(.white)
                    }
                    Button {
                        changeDate(by: 1)
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                    }
                    .buttonStyle(.glassProminent)
                    .buttonBorderShape(.circle)
                    .tint(.indigo)
                    .controlSize(.large)
                    .padding()
                }
                .padding()
                .padding(.bottom, 100)
            }
            
        }
        .ignoresSafeArea()
        .onAppear(){
            lunarMonths = self.dataService.getlunarMonths()
            mansions = self.dataService.getXiuData()
            updateFor(date: selectedDate)
            todayXiuName = LunarDataManager.todayXiuName(in: lunarMonths) ?? ""
            todayXiuItem = XiuResolver.todayXiu(in: lunarMonths, groups: mansions)
            todayXiuMansion = XiuResolver.todayMansion(in: lunarMonths, groups: mansions)
            lunarMonthName = LunarDataManager.lunarMonthName(from: lunarMonths) ?? "—"
            lunarDayName = LunarDataManager.lunarDayName(from: lunarMonths) ?? "—"
        }
        
    }
    
    private func changeDate(by offset: Int) {
        if let newDate = Calendar.current.date(byAdding: .day, value: offset, to: selectedDate) {
            selectedDate = newDate
            updateFor(date: newDate)
        }
    }
    
    private func updateFor(date: Date) {
        todayXiuName = LunarDataManager.xiuName(for: date, in: lunarMonths) ?? ""
        todayXiuItem = XiuResolver.findXiu(byMansionName: todayXiuName, in: mansions)
        todayXiuMansion = XiuResolver.findMansion(byMansionName: todayXiuName, in: mansions)
        lunarMonthName = LunarDataManager.lunarMonthName(from: lunarMonths, for: date) ?? "—"
        lunarDayName = LunarDataManager.lunarDayName(from: lunarMonths, for: date) ?? "—"
    }
    
    private var headerText: String {
        let cal = Calendar(identifier: .gregorian)
        if cal.isDateInToday(selectedDate) {
            return "★ TODAY ★ 旧暦｜Lunar calendar ★"
        } else {
            let df = DateFormatter()
            df.calendar = cal
            df.locale   = Locale(identifier: "ja_JP")
            df.timeZone = .current
            df.dateFormat = "yyyy年M月d日（E）"
            return df.string(from: selectedDate)
        }
    }
}


#Preview {
    SecondTabRoot()
}
