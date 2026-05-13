//
//  Test.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/4.
//

import SwiftUI

struct Test: View {
    
    var wordList = ["Cactus", "Apple", "Banana", "Orange", "Pineapple"]
    
    var body: some View {
        
        VStack(){
            
            List(wordList, id: \.self) { word in // \is path of somthing(.self)
                Text(word)
            }
            
            ForEach(0..<10) { num in
                Text(String(num))
            }
            
            ForEach(1..<10) { _ in
                Text("Hello")
            }
            
        }
        
    }
}


#Preview {
    Test()
}

