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
    public static let stripe: Color = dynamicColor("#E4E8EB", dark: "#3C3C47")
}
