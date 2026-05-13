//
//  EnterBirth.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/22.
//

import SwiftUI

struct BirthdatePicker: View {
    @Binding var birthDate: Date
    
    var body: some View {
        ZStack {
            
            VStack{
                Group{
                    Text("""
生年月日を入力
宿曜で占う、あなたの今日の運勢。
""")
                    Text("""
Enter Your Birthday
To discover today's fortune in the stars.
""")
                    
                }
                .multilineTextAlignment(.center)
                .lineSpacing(3)
                .font(.custom("HiraMinProN-W6", size: 20, relativeTo: .title))
                .padding(.bottom, 5)
                .foregroundColor(.yellow)

                DatePicker(
                    "",
                    selection: $birthDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 20))
                .padding()
                .colorScheme(.dark)
                
                Group{
                    Text("""
あなたの運命の鍵となる「本命宿」を割り出すために使用します。
入力された情報を保存、共有、販売することは一切ありません。
""")
                    Text("""
We use this to determine your "Birth Star", the key to your destiny.
We will never store, share, or sell your personal data.
""")
                }
                .multilineTextAlignment(.center)
                .font(.custom("HiraMinProN-W6", size: 13, relativeTo: .title))
                .lineSpacing(3)
                .padding(.bottom, 5)
                .padding(.horizontal, 50)
                .foregroundColor(.white)
                
            }
            .padding()
            .interactiveDismissDisabled()
        }
    }
}

#Preview {
    BirthdatePicker(birthDate: .constant(Date()))
        .preferredColorScheme(.dark)
}
