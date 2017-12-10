//
//  OpenSourceController.swift
//  Pods
//
//  Created by Florian Gabach on 05/02/2017.

import UIKit

public class OpenSourceController: NSObject { 

    // Contains list of licence object 
    open var licences: [LicenceFile]?

    // Configuration
    open var config = OpenSourceControllerConfig()

    /// Present OpenSourceViewController embbeded in navigation controller
    ///
    /// - Parameter from: the source controller 
    open func presentOpenSourceController(from: UIViewController) {
        // Create open source controller
        let licenceController = OpenSourceViewController()

        // Init licence 
        licenceController.licences = self.licences

        // Init config
        licenceController.config = self.config

        // Embed in navigation controller
        let navController = UINavigationController(rootViewController: licenceController)

        // Present controller 
        from.present(navController, animated: true)
    }
    
    /// Push OpenSourceViewController from navigation controller 
    ///
    /// - Parameter from: the source controller
    open func pushOpenSourceController(from: UIViewController) {
        // Create open source controller
        let licenceController = OpenSourceViewController()
        
        // Init licence
        licenceController.licences = self.licences
        
        // Init config
        licenceController.config = self.config
        
        // Push controller
        guard let navigationController = from.navigationController else {
            print("Source controller isn't embeded in navigation controller. Can't push.")
            return
        }
        navigationController.pushViewController(licenceController, animated: true)
    }
}
