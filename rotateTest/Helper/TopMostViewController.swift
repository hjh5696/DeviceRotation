//
//  TopMostViewController.swift
//  rotateTest
//
//  Created by Junhyeong Hong on 2022/08/23.
//

import UIKit

func getTopMostViewController(of vc: UIViewController) -> UIViewController {
    if let presented = vc.presentedViewController {
        return getTopMostViewController(of: presented)
    }
    
    if let tabSelected = (vc as? UITabBarController)?.selectedViewController {
        return getTopMostViewController(of: tabSelected)
    }
    
    if let navTop = (vc as? UINavigationController)?.topViewController {
        return getTopMostViewController(of: navTop)
    }
    
    return vc
}
