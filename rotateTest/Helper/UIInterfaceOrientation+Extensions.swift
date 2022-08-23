//
//  UIInterfaceOrientation+Extensions.swift
//  rotateTest
//
//  Created by Junhyeong Hong on 2022/08/23.
//

import UIKit

func currentOrientation() -> UIInterfaceOrientation {
    let windowScene = UIApplication.shared.connectedScenes
    // Keep only active scenes, onscreen and visible to the user
                .filter { $0.activationState == .foregroundActive }
                // Keep only the first `UIWindowScene`
                .first(where: { $0 is UIWindowScene }) as? UIWindowScene
    
    return windowScene?.interfaceOrientation ?? .portrait
}

extension UIInterfaceOrientationMask {
  func supports(_ orientation: UIInterfaceOrientation) -> Bool {
      return (orientation.isLandscape && (self.contains(.landscape) || self.contains(.landscapeLeft) || self.contains(.landscapeRight)))
        || (orientation.isPortrait && self.contains(.portrait))
  }

  func misses(_ orientation: UIInterfaceOrientation) -> Bool {
    return !supports(orientation)
  }

  public var description: String {
    switch self {
    case .all:
      return "all"
    case .allButUpsideDown:
      return "allButUpsideDown"
    case .landscape:
      return "landscape"
    case .landscapeLeft:
      return "landscapeLeft"
    case .landscapeRight:
      return "landscapeRight"
    case .portrait:
      return "portrait"
    case .portraitUpsideDown:
      return "portraitUpsideDown"
    default:
      return "Unkown UIInterfaceOrientationMask"
    }
  }
}

extension UIInterfaceOrientation {
  public var description: String {
    switch self {
    case .landscapeLeft:
      return "landscapeLeft"
    case .landscapeRight:
      return "landscapeRight"
    case .portrait:
      return "portrait"
    case .portraitUpsideDown:
      return "portraitUpsideDown"
    case .unknown:
      return "unknown"
    }
  }

  func toMask() -> UIInterfaceOrientationMask {
    return self.isPortrait ? .portrait : .landscape
  }
}


/// iOS v9.* has a bug that requires this extension, otherwise the app crashes
/// with the following message:
/// "UIAlertController:supportedInterfaceOrientations was invoked recursively"
/// Read more at https://stackoverflow.com/a/32010520/10070651.
extension UIAlertController {
  override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    // By having the alert supporting only the current orientation, we make sure
    // that we don't override the parent view controller supported orientations.
    // This is fine for users too since they were already in this orientation.
    return currentOrientation().toMask()
  }

  open override var shouldAutorotate: Bool {
    return false
  }
}
