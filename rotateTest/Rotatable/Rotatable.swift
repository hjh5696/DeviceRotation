//
//  Rotatable.swift
//  rotateTest
//
//  Created by Junhyeong Hong on 2022/08/22.
//

import UIKit

protocol Rotatable {
     func adjustOrientationIfNeeded(supportedOrientation: UIInterfaceOrientationMask)
 }

 extension Rotatable {
     func adjustOrientationIfNeeded(supportedOrientation: UIInterfaceOrientationMask) {
                // if the view controller's supportedInterfaceOrientations does not include current orientation of device, then force rotate.
                //TODO: use setNeedsUpdateOfSupportedInterfaceOrientations from iOS 16.
         print("Supports only \(supportedOrientation.description). But now it is \(currentOrientation().description).")
         if supportedOrientation.misses(currentOrientation()) {
             var orientation: UIInterfaceOrientation
             switch supportedOrientation {
             case .portrait, .allButUpsideDown, .all:
                 orientation = .portrait
             case .landscapeLeft:
                 orientation = .landscapeLeft
             case .landscapeRight, .landscape:
                 orientation = .landscapeRight
             case .portraitUpsideDown:
                 orientation = .portraitUpsideDown
             default:
                 orientation = .portrait
             }

             print("force orientation to \(orientation.description)")
             UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
             UIViewController.attemptRotationToDeviceOrientation()
         }
     }
}

extension Rotatable where Self: UIViewController {
    func adjustOrientationIfNeeded() {
        self.adjustOrientationIfNeeded(supportedOrientation: self.supportedInterfaceOrientations)
    }
}
