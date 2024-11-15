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
        case Regular
        case Medium
        case SemiBold
        case Bold
        case ExtraBold
        case Heavy
        
        public var name:String {
            switch self {
            
            case .Light:
                return "SUITE Light"
            case .Regular:
                return "SUITE Regular"
            case .Medium:
                return "SUITE Medium"
            case .SemiBold:
                return "SUITE SemiBold"
            case .Bold:
                return "SUITE Bold"
            case .ExtraBold:
                return "SUITE ExtraBold"
            case .Heavy:
                return "SUITE Heavy"
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

extension KHFont {
    
    public struct LargeTitle {
        private init() {}
        public static let L01 = Font.custom(FontType.Heavy.name, size: 34)
        public static let L02 = Font.custom(FontType.Heavy.name, size: 32)
        public static let L03 = Font.custom(FontType.Heavy.name, size: 30)
        public static let L04 = Font.custom(FontType.Heavy.name, size: 28)
        public static let L05 = Font.custom(FontType.Heavy.name, size: 26)
    }

    public struct Title {
        private init() {}
        public static let T01 = Font.custom(FontType.ExtraBold.name, size: 28)
        public static let T02 = Font.custom(FontType.ExtraBold.name, size: 26)
        public static let T03 = Font.custom(FontType.ExtraBold.name, size: 24)
        public static let T04 = Font.custom(FontType.ExtraBold.name, size: 22)
        public static let T05 = Font.custom(FontType.ExtraBold.name, size: 20)
    }

    public struct Headline {
        private init() {}
        public static let H01 = Font.custom(FontType.Bold.name, size: 40)
        public static let H02 = Font.custom(FontType.Bold.name, size: 32)
        public static let H03 = Font.custom(FontType.Bold.name, size: 28)
        public static let H04 = Font.custom(FontType.Bold.name, size: 26)
        public static let H05 = Font.custom(FontType.Bold.name, size: 24)
    }

    public struct SubHeadline {
        private init() {}
        public static let S01 = Font.custom(FontType.SemiBold.name, size: 40)
        public static let S02 = Font.custom(FontType.SemiBold.name, size: 32)
        public static let S03 = Font.custom(FontType.SemiBold.name, size: 28)
        public static let S04 = Font.custom(FontType.SemiBold.name, size: 24)
        public static let S05 = Font.custom(FontType.SemiBold.name, size: 20)
    }

    public struct Body {
        private init() {}
        public static let B01 = Font.custom(FontType.Regular.name, size: 24)
        public static let B02 = Font.custom(FontType.Regular.name, size: 22)
        public static let B03 = Font.custom(FontType.Regular.name, size: 20)
        public static let B04 = Font.custom(FontType.Regular.name, size: 18)
        public static let B05 = Font.custom(FontType.Regular.name, size: 16)
        public static let B06 = Font.custom(FontType.Regular.name, size: 15)
        public static let B07 = Font.custom(FontType.Regular.name, size: 14)
        public static let B08 = Font.custom(FontType.Regular.name, size: 13)
        public static let B09 = Font.custom(FontType.Regular.name, size: 12)
        public static let B10 = Font.custom(FontType.Regular.name, size: 10)
    }

    public struct Callout {
        private init() {}
        public static let C01 = Font.custom(FontType.Medium.name, size: 23)
        public static let C02 = Font.custom(FontType.Medium.name, size: 21)
        public static let C03 = Font.custom(FontType.Medium.name, size: 19)
        public static let C04 = Font.custom(FontType.Medium.name, size: 17)
        public static let C05 = Font.custom(FontType.Medium.name, size: 15)
        public static let C06 = Font.custom(FontType.Medium.name, size: 14)
        public static let C07 = Font.custom(FontType.Medium.name, size: 13)
        public static let C08 = Font.custom(FontType.Medium.name, size: 12)
        public static let C09 = Font.custom(FontType.Medium.name, size: 11)
        public static let C10 = Font.custom(FontType.Medium.name, size: 10)
    }

    public struct Caption {
        private init() {}
        public static let C01 = Font.custom(FontType.Light.name, size: 20)
        public static let C02 = Font.custom(FontType.Light.name, size: 18)
        public static let C03 = Font.custom(FontType.Light.name, size: 16)
        public static let C04 = Font.custom(FontType.Light.name, size: 14)
        public static let C05 = Font.custom(FontType.Light.name, size: 12)
        public static let C06 = Font.custom(FontType.Light.name, size: 11)
        public static let C07 = Font.custom(FontType.Light.name, size: 10)
        public static let C08 = Font.custom(FontType.Light.name, size: 9)
        public static let C09 = Font.custom(FontType.Light.name, size: 8)
        public static let C10 = Font.custom(FontType.Light.name, size: 7)
    }

}

 
//public struct KHFontStyle {
//    var font:Font
//    var lineSpacing:CGFloat
//}
//
//public extension KHFontStyle {
//    
//    static let display01 = KHFontStyle(font: KHFont.display01, lineSpacing: 2)
//    static let display02 = KHFontStyle(font: KHFont.display02, lineSpacing: 2)
//    
//    static let title01 = KHFontStyle(font: KHFont.title01, lineSpacing: 0)
//    static let title02 = KHFontStyle(font: KHFont.title02, lineSpacing: 0)
//    static let title03 = KHFontStyle(font: KHFont.title03, lineSpacing: 0)
//    
//    
//    static let subTitle01 = KHFontStyle(font: KHFont.subTitle01, lineSpacing: 4)
//    static let subTitle02 = KHFontStyle(font: KHFont.subTitle02, lineSpacing: 4)
//    static let subTitle03 = KHFontStyle(font: KHFont.subTitle03, lineSpacing: 4)
//    
//    static let body01 = KHFontStyle(font: KHFont.body01, lineSpacing: 2)
//    static let body02 = KHFontStyle(font: KHFont.body02, lineSpacing: 2)
//    
//    
//}
//
//
//public struct KHFontModifier : ViewModifier {
//    var style: KHFontStyle
//    
//    
//    public func body(content: Content) -> some View {
//        content.font(style.font).lineSpacing(style.lineSpacing)
//    }
//    
//}
//
//public extension View {
//    func applyFont(_ style:KHFontStyle) -> some View {
//        self.modifier(KHFontModifier(style: style))
//    }
//}
