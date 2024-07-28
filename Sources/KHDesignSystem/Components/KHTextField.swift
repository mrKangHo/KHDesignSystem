//
//  KHTextField.swift
//
//
//  Created by LEE on 7/28/24.
//

import SwiftUI

struct KHTextField: View {
    @Binding var text:String
    
    var placeHolder:String?
    var symboldIcon:Image?
    var keyboardType:UIKeyboardType = .default
    var font:Font = KHFont.subTitle02
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            symboldIcon.foregroundColor(isFocused ? KHColor.Primary.P00 : .gray).frame(width:44, height: 44)
            TextField(placeHolder ?? "", text: $text).keyboardType(keyboardType).font(font)
        }.background(
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(isFocused ? KHColor.Primary.P00 : KHColor.Gray.GR30, lineWidth: isFocused ? 2.0 : 1.5)
        )
        .focused($isFocused)
        
    }
}

#Preview {
    @State var text:String = ""
    
    let tf = KHTextField(text: $text, placeHolder: "텍스트를 입력하세요", symboldIcon: Image(systemName: "magnifyingglass"))
    print(text)
    return tf
    
}
