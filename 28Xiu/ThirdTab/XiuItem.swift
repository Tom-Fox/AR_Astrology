//
//  XiuItem.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/9.
//

import Foundation

struct XiuItem: Identifiable, Decodable{
    
    let id = UUID()
    
    var name: String
    var mansionName: String
    var imageName: String
    var modelName: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name, mansionName, imageName, modelName, description
    }

}
