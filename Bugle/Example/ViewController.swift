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
    
    @IBAction func didTapPlaySimpleMessageWithTitle(_ sender: UIButton) {
        // v2
        let alert = UIAlertController(style: .alert, title: "Bugle", message: "This is an alert with title")
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
    
    @IBAction func didTapPlaySimpleMessage(_ sender: UIButton) {
        // v1
        //Bugle.shared.play("Hello World!", on: self)
        
        // v2
        let alert = UIAlertController(message: "Hello World!")
        alert.play()
    }
    
    @IBAction func didTapPlayCustomMessage(_ sender: UIButton) {
        // v1
        /*let options: BugleOptions = [
            .cancel: "No, forget it",            
            .title: "Are you sure?",
            .action:  "Yes, I'm a savage",
        ]
        Bugle.shared.play("Push to master", options, on: self, ofType: .risky)*/
        
        // v2
        /*let alert = UIAlertController(style: .alert, title: String.customTitle, message: String.customMessage)
        alert.addAction(title: String.customCancel, style: .default)
        alert.addAction(UIAlertAction(title: String.customAction, style: .destructive)
        alert.show()*/
        
        //v2 with extension method
        UIAlertController.playRiskyCustomAlert(){ action in
            debugPrint("Confirm bugle")
        }
    }
    
}
