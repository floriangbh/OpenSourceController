//
//  OpenSourceTableViewCell.swift
//  Pods
//
//  Created by Florian Gabach on 05/02/2017.
//
//

import UIKit

class OpenSourceTableViewCell: UITableViewCell {

    // MARK: - Lifecycle

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default,
                   reuseIdentifier: reuseIdentifier)

        self.prepareCellComponent()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    // MARK: - Prepare

    func prepareCellComponent() {
        // Text
        self.textLabel?.numberOfLines = 0

        // Common init
        self.accessoryType = .none
        self.selectionStyle = .none
    }

    // MARK: - Configure

    /// Initialize the cell content with Licence model 
    ///
    /// - Parameter licence: the licence model 
    func configure(licence: LicenceFile) {

        // Build attributed text 
        let libraryTitleAttribut = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 2)]
        let libraryLicenceAttribut = [NSFontAttributeName: UIFont.systemFont(ofSize: UIFont.systemFontSize)]
        let libraryTitle = NSMutableAttributedString(string: licence.title ?? "",
                                                     attributes: libraryTitleAttribut)
        libraryTitle.append(NSAttributedString(string: "\n\n"))
        libraryTitle.append(NSAttributedString(string: licence.detail ?? "",
                                               attributes: libraryLicenceAttribut))

        // Set text 
        self.textLabel?.attributedText = libraryTitle
    }
}
