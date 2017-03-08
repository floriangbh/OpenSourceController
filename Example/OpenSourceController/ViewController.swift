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

    // MARK: - Lifecycle 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action 

    /// Handle button click & show the controller with licences 
    @IBAction func showOpenSource(_ sender: Any) {
        // Create controller 
        let openSourceVC = OpenSourceController()

        // Apply somre customisation if you want !
        self.controllerCustomUI(controller: openSourceVC)

        // Init with LicenceFile object 
        openSourceVC.licences = [LicenceFile(title: "FacebookImagePicker",
                                             url: "https://raw.githubusercontent.com/terflogag/FacebookImagePicker/master/LICENSE"),
                                 LicenceFile(title: "JSQMessagesViewController",
                                             url: "https://raw.githubusercontent.com/jessesquires/JSQMessagesViewController/develop/LICENSE"),
                                 LicenceFile(title: "OpenSourceController",
                                             url: "https://raw.githubusercontent.com/terflogag/OpenSourceController/master/LICENSE")]

        // Present controller 
        openSourceVC.presentOpenSourceController(from: self)
    }

    // Customization 

    fileprivate func controllerCustomUI(controller: OpenSourceController) {
        // Navigation bar title 
        controller.config.title = "MyCustomTitle"

        // Navigation bar tint color
        controller.config.uiConfig.barTintColor = UIColor.red

        // Close button color 
        controller.config.uiConfig.closeButtonColor = UIColor.white

        // BackgroundColor 
        controller.config.uiConfig.backgroundColor = UIColor.red.withAlphaComponent(0.6)

        // Licence text color  
        controller.config.uiConfig.licenceTextColor = UIColor.white

        // Navigation bar title color
        controller.config.uiConfig.titleColor = UIColor.white
        
        // Licence cell background color 
        controller.config.uiConfig.licenceBackgroundColor = UIColor.red
    }
}
