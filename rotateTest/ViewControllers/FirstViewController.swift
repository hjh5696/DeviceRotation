//
//  ViewController.swift
//  rotateTest
//
//  Created by Junhyeong Hong on 2022/08/03.
//

import UIKit

class FirstViewController: BaseViewController<SecondViewController> {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @objc override func presentPageSheet() {
        let vc = SecondViewController()
        vc.presentationController?.delegate = self
        vc.delegate = self
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    
    @objc override func presentFullScreen() {
        let vc = SecondViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

// for adaptive dismissal ex) user swiped down the pageSheet modal
extension FirstViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        print("presentationControllerWillDismiss", presentationController)
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        print("presentationControllerDidDismiss", presentationController)
        self.adjustOrientationIfNeeded(supportedOrientation: self.supportedInterfaceOrientations)
    }
}

// for programatic dismissal ex) by custom close button inside the modal
extension FirstViewController: PresentationDismissDelegate {
    func willDismiss() {
        print("SecondVC will dismiss")
    }
    func didDismissed() {
        print("SecondVC has been dismissed")
        self.adjustOrientationIfNeeded(supportedOrientation: self.supportedInterfaceOrientations)
    }
}
