//
//  ViewController.swift
//  Bugle
//
//  Created by Luis Burgos on 1/17/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapPlaySimpleMessage(_ sender: UIButton) {
        Bugle.shared.play("Hello World!", on: self)
    }
    
    @IBAction func didTapPlayCustomMessage(_ sender: UIButton) {
        let options: [BuglePiece : Any] = [
            .cancel: "No, forget it",
            .message: "Push to master",
            .action:  "Yes, I'm a savage",
        ]
        Bugle.shared.play("Are you sure?", options, on: self, ofType: .risky)
    }
    
}

extension ViewController: BugleDelegate {
    func didConfirm() {
        debugPrint("Confirm bugle")
    }
}
