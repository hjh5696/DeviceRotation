//
//  UIStatusBar+Extensions.swift
//  rotateTest
//
//  Created by Junhyeong Hong on 2022/08/23.
//

import UIKit

extension UIStatusBarStyle {
    var description: String {
        switch self {
        case .default:
            return "default"
        case .darkContent:
            return "darkContent"
        case .lightContent:
            return "lightContent"
        }
    }
}
