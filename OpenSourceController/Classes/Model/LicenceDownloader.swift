//
//  LicenceDownloader.swift
//  Pods
//
//  Created by Florian Gabach on 21/02/2017.

import UIKit

class LicenceDownloader: NSObject {

    /// Download every licence 
    ///
    /// - Parameters:
    ///   - licences: array which contains licence model model 
    ///   - completion: end downloading completion
    class func downloadLicences(licences: [LicenceFile],
                                config: OpenSourceControllerConfig,
                                completion: @escaping () -> Void) {
        // Number of licences 
        let licenceCount = licences.count

        // Already licence downloaded 
        var alreadyDownloaded = 0

        // Download licence's detail for every lience 
        for licence in licences {
            licence.downloadLicenceDetail(config: config, completion: { () in
                alreadyDownloaded += 1

                // If this is the last licence, perfom completion
                if licenceCount == alreadyDownloaded {
                    completion()
                }
            })
        }
    }
}
