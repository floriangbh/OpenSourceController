//
//  ViewController.swift
//  OpenSourceControllerDemo
//
//  Created by Florian Gabach on 04/04/2017.
//  Copyright © 2017 OpenSourceController. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Lifecycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Action 
    
    /// Handle button click & show the controller with licences 
    @IBAction func showOpenSource(_ sender: Any) {
        // Create controller 
        let openSourceVC = OpenSourceController()
        
        // Apply some customisation if you want 
        //self.applyCustomUI(openSourceVC: openSourceVC)
        
        // Init with LicenceFile object 
        openSourceVC.licences = [LicenceFile(title: "FacebookImagePicker",
                                             url: "https://raw.githubusercontent.com/terflogag/FacebookImagePicker/master/LICENSE"),
                                 LicenceFile(title: "JSQMessagesViewController",
                                             url: "https://raw.githubusercontent.com/jessesquires/JSQMessagesViewController/develop/LICENSE"),
                                 LicenceFile(title: "OpenSourceController",
                                             url: "https://raw.githubusercontent.com/terflogag/OpenSourceController/master/LICENSE"),
                                 LicenceFile(title: "PermissionScope",
                                             url: "https://raw.githubusercontent.com/nickoneill/PermissionScope/master/LICENSE"),
                                 LicenceFile(title: "EasyTipView",
                                             url: "https://raw.githubusercontent.com/teodorpatras/EasyTipView/master/LICENSE"),
                                 LicenceFile(title: "FakeAdress",
                                             url: "https://raw.giusercontent.com/ashleymills/Reachability.swift/master/LICENSE"),
                                 LicenceFile(title: "KeychainAccess",
                                             url: "https://raw.githubusercontent.com/kishikawakatsumi/KeychainAccess/master/LICENSE")]
        
        // Present controller
        openSourceVC.pushOpenSourceController(from: self)
        //openSourceVC.presentOpenSourceController(from: self)
    }
    
    // MARK: - Customization 
    
    fileprivate func applyCustomUI(openSourceVC: OpenSourceController) {
        // Navigation bar title
        openSourceVC.config.title = "MyCustomTitle"

        // Navigation bar tint color
        openSourceVC.config.uiConfig.barTintColor = UIColor.red

        // Close button color
        openSourceVC.config.uiConfig.closeButtonColor = UIColor.green

        // BackgroundColor
        openSourceVC.config.uiConfig.backgroundColor = UIColor.red.withAlphaComponent(0.6)

        // Licence text color
        openSourceVC.config.uiConfig.licenceTextColor = UIColor.green

        // Navigation bar title color
        openSourceVC.config.uiConfig.titleColor = UIColor.green

        // Licence cell background color
        openSourceVC.config.uiConfig.licenceBackgroundColor = UIColor.red

        // Verbose mode
        openSourceVC.config.verbose = true
    }
}
