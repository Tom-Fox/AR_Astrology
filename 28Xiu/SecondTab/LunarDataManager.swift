//
//  lunarMonths.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/12.
//

import Foundation

struct LunarMonth: Identifiable, Decodable{
    
    let id = UUID()
    var monthName: String
    var days: [LunarDay]
    
    private enum CodingKeys: String, CodingKey {
        case monthName, days
    }
}

struct LunarDay: Identifiable, Decodable {
    
    let id = UUID()
    var dayName: String
    var xiuName: String
    
    private enum CodingKeys: String, CodingKey {
        case dayName, xiuName
    }
}



struct LunarDataManager {
    
    private static let sep: Character = "｜" // 全角竖线
    
    private static var chineseCal: Calendar = {
        var cal = Calendar(identifier: .chinese)
        cal.timeZone = .current
        return cal
    }()

    // 今天的整段宿名，形如 "牛｜Ox"
    static func todayXiuName(in months: [LunarMonth]) -> String? {
        xiuName(for: Date(), in: months)
    }
    // 仅中文宿名，形如 "牛"
    static func todayXiuZH(in months: [LunarMonth]) -> String? {
        xiuName(for: Date(), in: months).map(zhPart)
    }

    // 任意日期 → 整段宿名 "中｜英"
    static func xiuName(for date: Date, in months: [LunarMonth]) -> String? {
        guard let (mZH, dZH, _) = lunarMonthDayZH(for: date) else { return nil }
        guard let month = months.first(where: { zhPart($0.monthName) == mZH }) else { return nil }
        guard let day   = month.days.first(where: { zhPart($0.dayName) == dZH }) else { return nil }
        return day.xiuName
    }

    // 任意日期 → 仅中文宿名
    static func xiuZH(for date: Date, in months: [LunarMonth]) -> String? {
        xiuName(for: date, in: months).map(zhPart)
    }

    // 农历 → 中文“月/日”标签
    private static func lunarMonthDayZH(for date: Date) -> (String, String, Bool)? {
        let comps = chineseCal.dateComponents([.year, .month, .day, .isLeapMonth], from: date)
        guard let m = comps.month, let d = comps.day else { return nil }
        let isLeap = comps.isLeapMonth ?? false
        return (monthLabelZH(m), dayLabelZH(d), isLeap)
    }
    
    static func lunarMonthName(from lunarMonths: [LunarMonth], for date: Date = Date()) -> String? {
        let comps = chineseCal.dateComponents([.month, .isLeapMonth], from: date)
        guard let m = comps.month else { return nil }
        let isLeap = comps.isLeapMonth ?? false
        
        guard m - 1 < lunarMonths.count else { return nil }
        let month = lunarMonths[m - 1]
        
        var monthName = month.monthName
        
        if isLeap {
            if let sepRange = monthName.range(of: "｜") {
                let zh = "閏" + monthName[..<sepRange.lowerBound]
                let en = monthName[sepRange.lowerBound...]
                monthName = zh + en
            } else {
                monthName = "閏" + monthName
            }
        }
        return monthName
    }
    
    static func lunarDayName(from lunarMonths: [LunarMonth], for date: Date = Date()) -> String? {
        let comps = chineseCal.dateComponents([.month, .day], from: date)
        guard let m = comps.month, let d = comps.day else { return nil }
        
        guard m - 1 < lunarMonths.count else { return nil }
        let month = lunarMonths[m - 1]
        guard d - 1 < month.days.count else { return nil }
        
        let day = month.days[d - 1]
        let dayName = day.dayName
        return dayName
    }

    private static func monthLabelZH(_ m: Int) -> String {
        switch m {
        case 1: return "正月"
        case 2: return "二月"
        case 3: return "三月"
        case 4: return "四月"
        case 5: return "五月"
        case 6: return "六月"
        case 7: return "七月"
        case 8: return "八月"
        case 9: return "九月"
        case 10: return "十月"
        case 11: return "十一月"
        case 12: return "十二月"
        default: return "\(m)月"
        }
    }

    private static func dayLabelZH(_ d: Int) -> String {
        precondition((1...30).contains(d), "农历日应在 1...30")
        switch d {
        case 1...9:   return "初" + digitZH(d)      // 初一..初九
        case 10:      return "初十"
        case 11...19: return "十" + digitZH(d-10)   // 十一..十九
        case 20:      return "二十"
        case 21...29: return "廿" + digitZH(d-20)   // 廿一..廿九
        case 30:      return "三十"
        default:      return ""
        }
    }

    private static func digitZH(_ n: Int) -> String {
        switch n {
        case 1: return "一"
        case 2: return "二"
        case 3: return "三"
        case 4: return "四"
        case 5: return "五"
        case 6: return "六"
        case 7: return "七"
        case 8: return "八"
        case 9: return "九"
        default: return ""
        }
    }

    // 取“中｜英”的中文部分
    private static func zhPart(_ s: String) -> String {
        if let i = s.firstIndex(of: sep) { return String(s[..<i]) }
        return s
    }
}

struct XiuResolver {
    
    // 找出今天对应的宿 (XiuItem)
    static func todayXiu(in lunarMonths: [LunarMonth], groups: [XiuMansion]) -> XiuItem? {
        guard let key = LunarDataManager.todayXiuName(in: lunarMonths) else { return nil }
        return findXiu(byMansionName: key, in: groups)
    }

    /// 根据宿名（如 "角｜Horn"）查找对应的 XiuItem
    static func findXiu(byMansionName key: String, in groups: [XiuMansion]) -> XiuItem? {
        for mansion in groups {
            if let xiu = mansion.xius.first(where: { $0.mansionName == key }) {
                return xiu
            }
        }
        return nil
    }
    
    // 找出今天对应的宿所在的上层 (XiuMansion)
    static func todayMansion(in lunarMonths: [LunarMonth], groups: [XiuMansion]) -> XiuMansion? {
        guard let key = LunarDataManager.todayXiuName(in: lunarMonths) else { return nil }
        return findMansion(byMansionName: key, in: groups)
    }

    // 根据宿名（如 "角｜Horn"）查找对应的 XiuMansion
    static func findMansion(byMansionName key: String, in groups: [XiuMansion]) -> XiuMansion? {
        for mansion in groups {
            if mansion.xius.contains(where: { $0.mansionName == key }) {
                return mansion
            }
        }
        return nil
    }
}
