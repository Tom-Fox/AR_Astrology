//
//  BirthXiu.swift
//  28Xiu
//
//  Created by kumo on 2025/10/14.
//

import SwiftUI

struct BirthXiu: View {
    @State var backImageName = "indigoGalaxy_reverse"
    
    @Binding var birthDate : Date
    @State var mansions: [XiuMansion] = []
    @State var birthXiuName: String = ""
    @State var birthXiuItem: XiuItem?
    @State var birthMansion: XiuMansion?
    @State var lunarMonths: [LunarMonth] = []
    @State var lunarMonthName: String = ""
    @State var lunarDayName: String = ""
    
    @State var birthxiuName: String = ""
    @State var birthMansionName: String = ""
    @State var birthXiuImage: String = ""
    @State var birthXiuDesc: String = ""
    @Binding var birthDirect: String
    
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
                VStack() {
                    Text("Your 28 Xiu")
                        .font(.custom("HiraMinProN-W6", size: 20, relativeTo: .title))
                        .padding()
                    XiuMansionFrame(
                        backImageName: $backImageName,
                        xiuName:$birthXiuName,
                        mansionName: $birthMansionName,
                        imageName: $birthXiuImage,
                        discription:$birthXiuDesc,
                    )
                }
                .padding(.bottom, 100)
                .padding()
            }
            .onAppear(){
                lunarMonths = self.dataService.getlunarMonths()
                mansions = self.dataService.getXiuData()
                updateFor(date: birthDate)
            }
    }
    
    private func updateFor(date: Date) {
        birthXiuName = LunarDataManager.xiuName(for: date, in: lunarMonths) ?? ""
        birthXiuItem = XiuResolver.findXiu(byMansionName: birthXiuName, in: mansions)
        birthMansion = XiuResolver.findMansion(byMansionName: birthXiuName, in: mansions)
        lunarMonthName = LunarDataManager.lunarMonthName(from: lunarMonths, for: date) ?? "—"
        lunarDayName = LunarDataManager.lunarDayName(from: lunarMonths, for: date) ?? "—"
        birthXiuImage = birthXiuItem?.imageName ?? "-"
        birthMansionName = birthMansion?.name ?? "-"
        birthXiuDesc = birthXiuItem?.description ?? "-"
        birthDirect = birthMansion?.direction ?? "-"
    }
}

#Preview {
    BirthXiu(
        birthDate: .constant(Date(timeIntervalSinceNow: 8000 * 160)),
        birthDirect: .constant("-")
    )
}

