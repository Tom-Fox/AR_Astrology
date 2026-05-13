//
//  NavigationSub1.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/9.
//

import Foundation

struct XiuMansion: Identifiable, Decodable {
    
    let id = UUID()
    
    var name: String
    var direction: String
    var imageName: String
    var summary: String
    
    var xius: [XiuItem]
    
    private enum CodingKeys: String, CodingKey {
        case name, direction, imageName, summary, xius
    }
}
