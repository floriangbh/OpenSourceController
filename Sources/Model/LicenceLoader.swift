//
//  LicenceDownloader.swift
//  Pods
//
//  Created by Florian Gabach on 21/02/2017.

import UIKit

final class LicenceLoader {

    /// Download every licence 
    ///
    /// - Parameters:
    ///   - licences: array which contains licence model model 
    ///   - completion: end downloading completion
    class func downloadLicences(licences: [LicenceFile],
                                config: OpenSourceControllerConfig,
                                completion: @escaping () -> Void) {
        let licenceGroupe = DispatchGroup()

        // Download licence's detail for every lience 
        for licence in licences {
            licenceGroupe.enter()
            
            licence.downloadLicenceDetail(config: config, completion: { () in
                licenceGroupe.leave()
            })
        }
        
        // When everything is downloaded
        licenceGroupe.notify(queue: .main) {
            completion()
        }
    }
}
