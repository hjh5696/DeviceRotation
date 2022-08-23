//
//  UINavigation+Extensions.swift
//  rotateTest
//
//  Created by Junhyeong Hong on 2022/08/03.
//

import Foundation
import UIKit

class CustomNavigationController: UINavigationController, Rotatable {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension CustomNavigationController {

  override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
      getTopMostViewController(of: self).supportedInterfaceOrientations
  }
    
//    override var childForStatusBarStyle: UIViewController? {
//        print("childForStatusBarSTyle.., NavigationController", getTopMostViewController(of: self))
//        return getTopMostViewController(of: self)
//    }
}


extension CustomNavigationController: UINavigationControllerDelegate {
  func navigationController(_ navigationController: UINavigationController,
                            willShow viewController: UIViewController,
                            animated: Bool)
  {
      print("willShow", viewController)
      // when navigating back from landscape-only to portrait-only, then topViewController is caught as Apple's private VC "UISnapshotModalViewController".
      // so pass the explicit parameter viewController.supportedInterfaceOrientations from here.
      self.adjustOrientationIfNeeded(supportedOrientation: viewController.supportedInterfaceOrientations)
  }
}
