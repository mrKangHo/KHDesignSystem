//
//  KHText.swift
//
//
//  Created by KANO on 3/13/24.
//

import SwiftUI

public struct KHText: View {
    public var text:String
    public var style:KHTextStyle

    public init(_ text: String, _ style: KHTextStyle = KHTextStyle(KHFont.custom(.Bold, size: 14), .black)) {
        self.text = text
        self.style = style
    }
    
    public var body: some View {
        Text(text).modifier(style)
    }
}

public struct KHTextStyle: ViewModifier {
    
    public let font:Font
    public let color:Color
    public let numberOfLine:Int?
    public let charSpacing:CGFloat
    public let alignment:TextAlignment
    
    public init(_ font: Font, _ color: Color, _ alignment:TextAlignment = .leading, _ numberOfLine:Int? = nil, _ charSpacing:CGFloat = -0.39) {
        self.font = font
        self.color = color
        self.alignment = alignment
        self.numberOfLine = numberOfLine
        self.charSpacing = charSpacing
    }
    
    public func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
            .lineLimit(numberOfLine)
            .multilineTextAlignment(alignment)
    }
}

#Preview {
    KHText("KHText")
}
