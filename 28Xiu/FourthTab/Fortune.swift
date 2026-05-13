//
//  Fortune.swift
//  28Xiu
//
//  Created by kumo on 2025/10/24.
//

import Foundation

struct Fortune: Identifiable, Decodable {
    
    let id = UUID()
    
    var combination: String
    var imageName: String
    var title: String
    var title_kata: String
    var brief: String
    var brief_kata: String
    var discription_jp: String
    var discription_en: String
    
    private enum CodingKeys: String, CodingKey {
        case combination, imageName, title, title_kata, brief, brief_kata, discription_jp, discription_en
    }
    
    // Default fallback so Fortune() compiles
    init() {
        self.combination = ""
        self.imageName = ""
        self.title = ""
        self.title_kata = ""
        self.brief = ""
        self.brief_kata = ""
        self.discription_jp = ""
        self.discription_en = ""
    }
}

//static func findMansion(byMansionName key: String, in groups: [XiuMansion]) -> XiuMansion? {
struct FortuneTelling {
    static func findFortune (byCombination key: String, in groups: [Fortune]) -> Fortune? {
        // Exact match on combination; change to `.contains(key)` if substring is desired.
        return groups.first(where: { $0.combination == key })
    }
}
