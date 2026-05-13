//
//  TodaysXiu.swift
//  28Xiu
//
//  Created by kumo on 2025/10/14.
//

import SwiftUI

struct TodaysXiu: View {
    @State private var isShowingDetailView = false
    @State var backImageName = "indigoGalaxy3"
    
    @State var mansions: [XiuMansion] = []
    
    @State var todayXiuItem: XiuItem?
    @State var todayMansion: XiuMansion?
    @State var lunarMonths: [LunarMonth] = []
    @State var lunarMonthName: String = ""
    @State var lunarDayName: String = ""

    @State private var todayDate = Date()
    
    @State var todayMansionName: String = ""
    @State var todayXiuName: String = ""
    @State var todayXiuImage: String = ""
    @State var todayXiuDesc: String = ""
    @Binding var todayDirect: String
    
    var dataService = DataService()
    
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
                    Text("Today's 28 Xiu")
                        .font(.custom("HiraMinProN-W6", size: 20, relativeTo: .title))
                        .foregroundColor(.white)
                        .padding()
                    XiuMansionFrame(
                        backImageName:$backImageName,
                        xiuName:$todayXiuName,
                        mansionName: $todayMansionName,
                        imageName: $todayXiuImage,
                        discription:$todayXiuDesc,
                    )
                }
                .padding(.bottom, 100)
                .padding()
            }
            .onAppear(){
                lunarMonths = self.dataService.getlunarMonths()
                mansions = self.dataService.getXiuData()
                updateFor(date: todayDate)
            }
    }
    
    private func updateFor(date: Date) {
        todayXiuName = LunarDataManager.todayXiuName(in: lunarMonths) ?? ""
        todayXiuItem = XiuResolver.todayXiu(in: lunarMonths, groups: mansions)
        todayMansion = XiuResolver.findMansion(byMansionName: todayXiuName, in: mansions)
        lunarMonthName = LunarDataManager.lunarMonthName(from: lunarMonths, for: date) ?? "—"
        lunarDayName = LunarDataManager.lunarDayName(from: lunarMonths, for: date) ?? "—"
        todayXiuImage = todayXiuItem?.imageName ?? "-"
        todayMansionName = todayMansion?.name ?? "-"
        todayXiuDesc = todayXiuItem?.description ?? "-"
        todayDirect = todayMansion?.direction ?? "-"
    }
}

#Preview {
    TodaysXiu(todayDirect: .constant(""))
}

