//
//  KHButton.swift
//
//
//  Created by KANO on 3/13/24.
//

import SwiftUI

public struct KHButton: View {
    public let title:String
    public let action:() -> Void
    public let style:KHButtonStyle
    
    public init(title:String, action: @escaping () -> Void, _ style:KHButtonStyle = KHButtonStyle(background: .clear)) {
        self.title = title
        self.action = action
        self.style = style
    }
    
    public var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(title)
                .modifier(style)
        }
    }
}


public struct KHButtonStyle:ViewModifier {
    
    public let background: Color?
    public let radius: CGFloat
    public let borderColor: Color?
    public let borderWidth: CGFloat
    public let shadowColor: Color?
    public let shadowXoffset: CGFloat
    public let shadowYoffset: CGFloat
    
    public init(background: Color? = nil, _ radius:CGFloat = 0, _ borderColor: Color? = nil, _ borderWidth:CGFloat = 0, _ shadowColor: Color? = nil, _ shadowXoffset: CGFloat = 1.0, _ shadowYoffset: CGFloat = 1.0) {
        self.background = background
        self.radius = radius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.shadowColor = shadowColor
        self.shadowXoffset = shadowXoffset
        self.shadowYoffset = shadowYoffset
    }
    
    public func body(content: Content) -> some View {
        
        content
            .padding()
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .background(background)
            .cornerRadius(radius)
            .overlay(borderOverlay)
            .shadow(color: shadowColor ?? .clear, radius: radius, x: shadowXoffset, y: shadowYoffset)
    }
    
    @ViewBuilder
    private var borderOverlay: some View {
        if let borderColor = borderColor {
            RoundedRectangle(cornerRadius: radius)
                .strokeBorder(borderColor, lineWidth: borderWidth)
        }
    }
    
}

#Preview {
    KHButton(title: "KHButton") {
        
    }
}
