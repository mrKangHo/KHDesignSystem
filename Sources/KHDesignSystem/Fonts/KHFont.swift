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


public extension Font {
    
}
