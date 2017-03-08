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
    public var licences: [LicenceFile]?
    public var title: String?

    /// Present OpenSourceViewController embbeded in navigation controller
    ///
    /// - Parameter from: the source controller 
    public final func presentOpenSourceController(from: UIViewController) {
        // Create open source controller
        let licenceController = OpenSourceViewController()

        // Init licence 
        licenceController.licences = self.licences
        licenceController.title = title ?? ""

        // Embed in navigation controller
        let navController = UINavigationController(rootViewController: licenceController)

        // Present controller 
        from.present(navController, animated: true)
    }
}
