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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapPlaySimpleMessage(_ sender: UIButton) {
        Bugle.shared.play("Hello World!", "Bugle Bugle!", on: self)
    }
    
    @IBAction func didTapPlayCustomMessage(_ sender: UIButton) {
        Bugle.shared.play("Are you sure?", "Push to master", "Yes, I'm a savage", true, self, on: self, type: .risky)
    }
    
}

extension ViewController: BugleDelegate {
    func didConfirm() {
        debugPrint("Confirm bugle")
    }
}
