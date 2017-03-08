//
//  OpenSourceController.swift
//  Pods
//
//  Created by Florian Gabach on 05/02/2017.
//
//

import UIKit

public class OpenSourceController: NSObject {

    // Contains list of licence object 
    open var licences: [LicenceFile]?

    // Client-side authorization options.
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
}
