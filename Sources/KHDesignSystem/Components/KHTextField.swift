//
//  KHTextField.swift
//
//
//  Created by LEE on 7/28/24.
//

import SwiftUI

public struct KHTextField: View {
    @Binding public var text:String
    @FocusState private var isFocused: Bool
    public var placeHolder:String?
    public var symboldIcon:Image?
    public var keyboardType:UIKeyboardType
    public var font:Font
    

    public init(text: Binding<String>, 
         placeHolder: String? = nil,
         symboldIcon: Image? = nil,
         keyboardType: UIKeyboardType = .default,
                font: Font = KHFont.Callout.C02) {
        self._text = text
        self.placeHolder = placeHolder
        self.symboldIcon = symboldIcon
        self.keyboardType = keyboardType
        self.font = font
    }
    
    public var body: some View {
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


struct ContentView: View {
    @State private var inputText: String = ""

    var body: some View {
        VStack {
            KHTextField(text: $inputText)
            Text("You entered: \(inputText)")
        }
        .padding()
    }
}
#Preview {
    ContentView()
    
}
