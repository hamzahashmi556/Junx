//
//  Extension+Font.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import Foundation
import SwiftUI

extension Font {
    
    static func customFont(name: FontName, type: FontsType, size: CGFloat) -> Font {
        return Font.custom("\(name.rawValue)-\(type.rawValue)", size: size)
    }
}

enum FontName: String {
    case manuale = "Manuale"
    case inter = "Inter"
    case skModernist = "Sk-Modernist"
}

enum FontsType: String {
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case extraBold = "ExtraBold"
    case extraBoldItalic = "ExtraBoldItalic"
    case italic = "Italic"
    case light = "Light"
    case lightItalic = "LightItalic"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case regular = "Regular"
    case semiBold = "SemiBold"
    case semiBoldItalic = "SemiBoldItalic"
}
