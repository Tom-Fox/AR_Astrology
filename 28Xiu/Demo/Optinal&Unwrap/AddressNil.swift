//
//  AddressNil.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/10.
//

import SwiftUI

struct XiuItem2 {
    var name: String
}

struct AddressNil: View {
    
    var selectedFood: String? = nil // Optional
    
    // default value of an optional data type is actually nil
    var xiuMansion: XiuItem2? = XiuItem2(name: "Xi'u Mansion")
    
    var body: some View {
        
        VStack {
            
            // Way1 #if else
            if selectedFood == nil {
                Text("No Food Selected")
            }
            else {
              Text(selectedFood!) // Unwrap
            }
            
            // Way2 #Optional binding
            if let food = selectedFood {
                // If this is nil, it will bypass check and it wont execute the code inside
                Text(food) // Optional binding
            }
            
            // Way3 #Nil coalescing operator
            // ?? saying that if this is nil, lets provide another default value
            Text(selectedFood ?? "No Food Selected")
            
            if xiuMansion != nil {
                Text(xiuMansion!.name)
            }
            
            if let mansionName = xiuMansion {
                Text(mansionName.name)
            }
            
            if xiuMansion != nil {
                Text(xiuMansion!.name) // Optional chaining
            }
            
            Text(xiuMansion?.name ?? "No Mansion")
        }
       
    }
    
}

#Preview {
    AddressNil()
}
