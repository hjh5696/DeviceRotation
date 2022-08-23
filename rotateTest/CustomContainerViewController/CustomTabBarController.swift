//
//  UITabBarController+Extensions.swift
//  rotateTest
//
//  Created by Junhyeong Hong on 2022/08/04.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        getTopMostViewController(of: self).supportedInterfaceOrientations
    }
}
