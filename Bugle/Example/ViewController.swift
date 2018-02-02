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
        let options: BugleOptions = [
            .cancel: "No, forget it",            
            .title: "Are you sure?",
            .action:  "Yes, I'm a savage",
        ]
        Bugle.shared.play("Push to master", options, on: self, ofType: .risky)
    }
    
}

extension ViewController: BugleDelegate {
    func didConfirm() {
        debugPrint("Confirm bugle")
    }
}
