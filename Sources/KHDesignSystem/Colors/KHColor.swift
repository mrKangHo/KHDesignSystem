//
//  File.swift
//  
//
//  Created by KANO on 3/13/24.
//

import SwiftUI
public enum KHColor {
    public static func hexToColor(hex: String) -> UIColor {
          let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
          var int: UInt64 = 0
          Scanner(string: hex).scanHexInt64(&int)
          return UIColor(red: CGFloat(int >> 16) / 255,
                         green: CGFloat(int >> 8 & 0xFF) / 255,
                         blue: CGFloat(int & 0xFF) / 255,
                         alpha: 1)
      }
      
      public static func dynamicColor(_ light: String, dark: String? = nil) -> Color {
          let lightColor = hexToColor(hex: light)
          if dark == nil {
              return Color(lightColor)
          } else {
              let darkColor = hexToColor(hex: dark!)
              return Color(UIColor { $0.userInterfaceStyle == .dark ? darkColor : lightColor })
          }
      }
}


extension KHColor {
    struct Primary {
        private init() {}
        static let P00 = KHColor.dynamicColor("#1849d6")
        static let P10 = KHColor.dynamicColor("#2f5bda", dark: "#1642C1")
        static let P30 = KHColor.dynamicColor("#5d80e2", dark: "#0E2C80")
        static let P70 = KHColor.dynamicColor("#bac8f3", dark: "#0A1D56")
        static let P80 = KHColor.dynamicColor("#d1dbf7", dark: "#071640")
        static let P90 = KHColor.dynamicColor("#e8edfb", dark: "#050F2B")
    }
    
    struct Secondary {
        private init() {}
        static let SC00 = KHColor.dynamicColor("#00cc83")
        static let SC10 = KHColor.dynamicColor("#1ad18f", dark: "#00b876")
        static let SC30 = KHColor.dynamicColor("#4ddba8", dark: "#007A4F")
        static let SC70 = KHColor.dynamicColor("#b3f0da", dark: "#005234")
        static let SC80 = KHColor.dynamicColor("#ccf5e6", dark: "#003d27")
        static let SC90 = KHColor.dynamicColor("#e6faf3", dark: "#00291a")
    }
    
    struct Orange {
        private init() {}
        static let OR00 = KHColor.dynamicColor("#ffa24d")
        static let OR10 = KHColor.dynamicColor("#ffab5f", dark: "#e69245")
        static let OR30 = KHColor.dynamicColor("#ffbe82", dark: "#99612e")
        static let OR70 = KHColor.dynamicColor("#ffe3ca", dark: "#66411f")
        static let OR80 = KHColor.dynamicColor("#ffecdb", dark: "#4c3117")
        static let OR90 = KHColor.dynamicColor("#fff6ed", dark: "#33200f")
    }
    
    struct Red {
        private init() {}
        static let RD00 = KHColor.dynamicColor("#ff3636")
        static let RD10 = KHColor.dynamicColor("#ff4a4a", dark: "#e63131")
        static let RD30 = KHColor.dynamicColor("#ff7272", dark: "#992020")
        static let RD70 = KHColor.dynamicColor("#ffc3c3", dark: "#661616")
        static let RD80 = KHColor.dynamicColor("#ffd7d7", dark: "#4c1010")
        static let RD90 = KHColor.dynamicColor("#ffebeb", dark: "#330b0b")
    }
    
    struct Green {
        private init() {}
        static let GR00 = KHColor.dynamicColor("#1fbe42")
        static let GR10 = KHColor.dynamicColor("#35c555", dark: "#1cab3b")
        static let GR30 = KHColor.dynamicColor("#62d27b", dark: "#137228")
        static let GR70 = KHColor.dynamicColor("#bcecc6", dark: "#0C4C1A")
        static let GR80 = KHColor.dynamicColor("#d2f2d9", dark: "#093914")
        static let GR90 = KHColor.dynamicColor("#e9f9ec", dark: "#06260d")
    }
    
    struct Label {
        private init() {}
        static let LB00 = KHColor.dynamicColor("#000000", dark: "#FFFFFF")
        static let LB10 = KHColor.dynamicColor("#282828", dark: "#EBEBEB")
        static let LB30 = KHColor.dynamicColor("#3C3C3C", dark: "#D7D7D7")
        static let LB70 = KHColor.dynamicColor("#505050", dark: "#C3C3C3")
    }
    
}

 
