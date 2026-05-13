//
//  frameZero.swift
//  28Xiu
//
//  Created by kumo on 2025/10/13.
//

import SwiftUI

struct FourthTabRoot: View {
    @State private var isShowingNextView = false
    @State private var showSheet = false
    @State private var birthDate = Date()
    @Binding var birthDirect: String //承载从 BirthXiu 回传的值
    @State var mansions: [XiuMansion] = []
    @State var todayMansion: XiuMansion?
    @State var lunarMonths: [LunarMonth] = []
    @State private var todayDate = Date()
    @State var todayDirect: String = ""
    var dataService = DataService()

    // NavigationPath for the whole Fourth tab
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Rectangle()
                    .background {
                        Image("indigoGalaxy3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .foregroundColor(.clear)
                    .ignoresSafeArea()
                
                VStack() {
                    
                    Image(systemName: "rainbow")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 60))
                        .symbolEffect(.variableColor, isActive: true)
                    
                    BirthdatePicker(birthDate: $birthDate)
                    
                    Button {
                        showSheet.toggle()
                    } label: {
                        Label("Discover!", systemImage: "eye.fill")
                            .padding(.horizontal, 50)
                    }
                    .customButtonStyle()
                    .sheet(isPresented: $showSheet) {
                        ComparisonSheet(showSheet: $showSheet,
                                        isShowingNextView: $isShowingNextView,
                                        birthDate: $birthDate,
                                        birthDirect: $birthDirect,
                                        todayDirect: $todayDirect)
                    }
                }
            }
            .onAppear(){
                lunarMonths = self.dataService.getlunarMonths()
                mansions = self.dataService.getXiuData()
                updateFor(date: todayDate)
            }
            // 通过 onChange 来 push 路由
            .navigationDestination(for: DivinationRoute.self) { route in
                switch route {
                case .omikuji:
                    OmikujiView(birthDirect: $birthDirect,
                                todayDirect: $todayDirect,
                                path: $path)
                case .fortune(let comb):
                    FortuneTellingView(fortCombination: .constant(comb),
                                       path: $path)
                }
            }
            .onChange(of: isShowingNextView) { _, newValue in
                if newValue {
                    // push to Omikuji via route
                    path.append(DivinationRoute.omikuji)
                    isShowingNextView = false
                }
            }
        }
    }
    private func updateFor(date: Date) {
        todayMansion = XiuResolver.todayMansion(in: lunarMonths, groups: mansions)
        todayDirect = todayMansion?.direction ?? "-"
    }
}

#Preview {
    FourthTabRoot(
        birthDirect: .constant("E")
    )
}
