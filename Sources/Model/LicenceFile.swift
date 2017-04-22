//
//  LicenceFile.swift
//  Pods
//
//  Created by Florian Gabach on 05/02/2017.

import UIKit

public class LicenceFile: NSObject {

    // MARK- Var 

    /// Name of the library 
    var title: String?

    /// Url of the library's licence 
    var url: String

    /// Library's licence
    var detail: String?

    // MARK- Init

    /// Licence initializer 
    ///
    /// - Parameters:
    ///   - title: name of the library
    ///   - url: url of the licence content 
    public init(title: String, url: String) {
        self.title = title
        self.url = url
        self.detail = NSLocalizedString("Unable to load this licence file.",
                                        comment: "")
    }

    /// Download licence detail
    ///
    /// - Parameter completion: end of download handler
    func downloadLicenceDetail(config: OpenSourceControllerConfig,
                               completion: @escaping (Void) -> Void) {
        if let url = URL(string: self.url) {
            let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
                if let data = data,
                    let html = String(data: data, encoding: String.Encoding.utf8) {

                    // Update licence model 
                    self.detail = html

                    // Log 
                    if config.verbose {
                        print("Licence for \(self.title ?? "") downloaded with success.")
                    }
                }
                completion()
            }
            task.resume()
        }
    }
}
