//
//  UIFont+Extension.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 30.08.2023.
//

import UIKit

enum PoppinsWeight: String {
    case bold = "Poppins-Bold"
    case semibold = "Poppins-Semibold"
    case regular = "Poppins-Regular"
}

extension UIFont {
    static func poppins(weight: PoppinsWeight, size: CGFloat) -> UIFont? {
        UIFont(name: weight.rawValue, size: size)
    }
}
