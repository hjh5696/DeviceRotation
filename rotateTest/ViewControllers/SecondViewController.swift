//
//  SecondViewController.swift
//  rotateTest
//
//  Created by Junhyeong Hong on 2022/08/03.
//

import Foundation
import UIKit

class SecondViewController: BaseViewController<ThirdViewController> {
        
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        // when presented, we need to manually call this
        self.adjustOrientationIfNeeded()
    }
}
