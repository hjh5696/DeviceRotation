//
//  FourthViewController.swift
//  rotateTest
//
//  Created by Junhyeong Hong on 2022/08/22.
//

import Foundation
import UIKit

class FourthViewController: BaseViewController<UIViewController> {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
