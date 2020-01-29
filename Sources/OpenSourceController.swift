//
//  OpenSourceController.swift
//  Pods
//
//  Created by Florian Gabach on 05/02/2017.

import UIKit
#if canImport(SwiftUI)
import SwiftUI
#endif

open class OpenSourceController: NSObject { 

    // Contains list of licence object 
    open var licences: [LicenceFile] = []

    // Open source controller Configuration object
    open var config = OpenSourceControllerConfig()

    /// Present OpenSourceViewController embbeded in navigation controller
    ///
    /// - Parameter from: the source controller 
    open func presentOpenSourceController(from: UIViewController) {
        let loader: LicenceLoader = LicenceLoader()
        let licenceController = OpenSourceViewController(licences: licences,
                                                         showCloseButton: true,
                                                         configuration: config,
                                                         licenceLoader: loader)
        let navController = UINavigationController(rootViewController: licenceController)
        from.present(navController, animated: true)
    }
    
    /// Push OpenSourceViewController from navigation controller 
    ///
    /// - Parameter from: the source controller
    open func pushOpenSourceController(from: UIViewController) {
        let loader: LicenceLoader = LicenceLoader()
        let licenceController = OpenSourceViewController(licences: licences,
                                                         showCloseButton: false,
                                                         configuration: config,
                                                         licenceLoader: loader)
        guard let navigationController = from.navigationController else {
            assertionFailure("Source controller isn't embeded in navigation controller. Can't push.")
            return
        }
        navigationController.pushViewController(licenceController, animated: true)
    }
}

