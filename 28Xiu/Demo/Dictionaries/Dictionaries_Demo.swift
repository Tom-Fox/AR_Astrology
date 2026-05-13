//
//  Dictionaries_Demo.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/10.
//

import SwiftUI

struct Dictionaries_Demo: View {
    
    @State var myArray: [String] = ["Orange", "Banana", "Pineapple"]
    
    // key value pair
    @State var myDictionary: [String: String] = ["Name": "S@mmy", "Age": "24"]
    
    var myEmptyArray = [String]()
    var myEmptyDictionary = [String: String]()
    
    var a: [String] = []
    
    var body: some View {
        
        let myArrayResult = myArray.joined(separator: ", ")
        let myDictionaryResult = myDictionary
            .sorted { $0.key < $1.key } // 可选：保证稳定顺序
            .map { "\($0.key): \($0.value)" }
            .joined(separator: ", ")
        
        Button("Add!") {
            myArray.append("Pear")
            myDictionary["Nickname"] = "Sammy!"
        }
        
        Button("Remove!") {
            myArray.removeLast()
            myDictionary["Nickname"] = nil
        }
        
        Text(myArrayResult)
        Text(myDictionaryResult)
        
        Text(myArray[1])
        
        // Optional: in a dictionary, when you give it a key, it is unkonwn whether or not that key exists and whether or not that key can actually bring you back a value
        Text("\(myDictionary["Name"])")
        
        // Unwarp it inorder to access to the value.
        // If pass in a key that doesnt exist, then try to unwarp it exclamation mark, it get a crash
        Text("\(myDictionary["Name"]!)")
        
        // Solution1
        if myDictionary["Name"] != nil {
            Text("Unwrapped: \(myDictionary["Name"]!)")
        }
        
        // Solution2
        Text("\(myDictionary["JDF"] ?? "Peach")")
        
    }
    
    
}

#Preview {
    Dictionaries_Demo()
}
