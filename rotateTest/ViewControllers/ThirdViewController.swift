//
//  ThirdViewController.swift
//  rotateTest
//
//  Created by Junhyeong Hong on 2022/08/04.
//

import Foundation
import UIKit

class ThirdViewController: BaseViewController<FourthViewController> {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .allButUpsideDown
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}
