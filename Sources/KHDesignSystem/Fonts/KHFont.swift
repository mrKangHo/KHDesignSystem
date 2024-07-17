//
//  KHFont.swift
//
//
//  Created by KANO on 3/13/24.
//

import SwiftUI

public struct KHFont {
    
    public enum FontType:CaseIterable {
        case Light
        case Medium
        case Bold
        
        public var name:String {
            switch self {
            case .Light:
                return "GmarketSansLight"
            case .Medium:
                return "GmarketSansMedium"
            case .Bold:
                return "GmarketSansBold"
            }
        }
        
    }
    
    
    public static func loadFonts(){
        KHFont.FontType.allCases.forEach {
            registerFont(bundle: .module,
                         fontName: $0.name,
                         fontExtension: "otf")
        }
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
                  fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?

        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    
    public static func custom(_ type:FontType, size:CGFloat) -> Font {
        return Font.custom(type.name, size: size)
    }
    
}

public extension KHFont {
    
    static let display01 = Font.custom(FontType.Bold.name, size: 40)
    static let display02 = Font.custom(FontType.Bold.name, size: 32)
    
    static let title01 = Font.custom(FontType.Bold.name, size: 28)
    static let title02 = Font.custom(FontType.Bold.name, size: 24)
    static let title03 = Font.custom(FontType.Bold.name, size: 20)
    
    static let subTitle01 = Font.custom(FontType.Medium.name, size: 20)
    static let subTitle02 = Font.custom(FontType.Medium.name, size: 16)
    static let subTitle03 = Font.custom(FontType.Medium.name, size: 14)
    
    static let body01 = Font.custom(FontType.Light.name, size: 15)
    static let body02 = Font.custom(FontType.Light.name, size: 14)
    
    
}

 
public struct KHFontStyle {
    var font:Font
    var lineSpacing:CGFloat
}

public extension KHFontStyle {
    
    static let display01 = KHFontStyle(font: KHFont.display01, lineSpacing: 2)
    static let display02 = KHFontStyle(font: KHFont.display02, lineSpacing: 2)
    
    static let title01 = KHFontStyle(font: KHFont.title01, lineSpacing: 0)
    static let title02 = KHFontStyle(font: KHFont.title02, lineSpacing: 0)
    static let title03 = KHFontStyle(font: KHFont.title03, lineSpacing: 0)
    
    
    static let subTitle01 = KHFontStyle(font: KHFont.subTitle01, lineSpacing: 4)
    static let subTitle02 = KHFontStyle(font: KHFont.subTitle02, lineSpacing: 4)
    static let subTitle03 = KHFontStyle(font: KHFont.subTitle03, lineSpacing: 4)
    
    static let body01 = KHFontStyle(font: KHFont.body01, lineSpacing: 2)
    static let body02 = KHFontStyle(font: KHFont.body02, lineSpacing: 2)
    
    
}


public struct KHFontModifier : ViewModifier {
    var style: KHFontStyle
    
    
    public func body(content: Content) -> some View {
        content.font(style.font).lineSpacing(style.lineSpacing)
    }
    
}

public extension View {
    func appleyFontStyle(_ style:KHFontStyle) -> some View {
        self.modifier(KHFontModifier(style: style))
    }
}
