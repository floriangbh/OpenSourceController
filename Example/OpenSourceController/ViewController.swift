//
//  ViewController.swift
//  OpenSourceController
//
//  Created by terflogag on 01/30/2017.
//  Copyright (c) 2017 terflogag. All rights reserved.
//

import UIKit
import OpenSourceController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showOpenSource(_ sender: Any) {
        // Create controller 
        let openSourceVC = OpenSourceController()

        // Init with LicenceFile object 
        openSourceVC.licences = [LicenceFile(title: "FacebookImagePicker",
                                             url: "https://raw.githubusercontent.com/terflogag/FacebookImagePicker/master/LICENSE"),
//                                 LicenceFile(title: "JSQMessagesViewController",
//                                             url: "https://raw.githubusercontent.com/jessesquires/JSQMessagesViewController/develop/LICENSE"),
//                                 LicenceFile(title: "OpenSourceController",
//                                             url: "https://raw.githubusercontent.com/terflogag/OpenSourceController/master/LICENSE"),
                                 LicenceFile(title: "Twitter & Fabric", 
                                             url: " http://get.fabric.io/terms/opensource.txt")]

        // Present controller 
        openSourceVC.presentOpenSourceController(from: self)
    }
}
