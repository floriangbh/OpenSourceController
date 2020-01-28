//
//  LicenceFile.swift
//  Pods
//
//  Created by Florian Gabach on 05/02/2017.

import UIKit

open class LicenceFile {

    // MARK- Var 

    /// Name of the library 
    var title: String?

    /// Url of the library's licence 
    var url: String

    /// Library's licence
    var detail: String?
    
    /// Build attributed text
    lazy var attributedContent: NSAttributedString = {
        let libraryTitleAttribut = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 2)]
        let libraryLicenceAttribut = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: UIFont.systemFontSize)]
        let libraryTitle = NSMutableAttributedString(string: self.title ?? "", attributes: libraryTitleAttribut)
        libraryTitle.append(NSAttributedString(string: "\n\n"))
        libraryTitle.append(NSAttributedString(string: self.detail ?? "", attributes: libraryLicenceAttribut))
        return libraryTitle
    }()

    // MARK- Init

    /// Licence initializer 
    ///
    /// - Parameters:
    ///   - title: name of the library
    ///   - url: url of the licence content 
    public init(title: String, url: String) {
        self.title = title
        self.url = url
        self.detail = NSLocalizedString("Unable to load this licence file.", comment: "")
    }

    /// Download licence detail
    ///
    /// - Parameter completion: end of download handler
    func downloadLicenceDetail(config: OpenSourceControllerConfig,
                               completion: @escaping () -> Void) {
        let licenceHTTPLoader = HTTPDataLoader()
        licenceHTTPLoader.loadData(fromUrl: self.url) { (data) in
            if let data = data, let html = String(data: data, encoding: String.Encoding.utf8) {
                self.detail = html
            }
            completion()
        }
    }
}
