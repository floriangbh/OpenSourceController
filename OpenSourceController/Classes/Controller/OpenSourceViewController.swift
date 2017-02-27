//
//  OpenSourceViewController.swift
//  Pods
//
//  Created by Florian Gabach on 05/02/2017.
//
//

import UIKit

class OpenSourceViewController: UITableViewController {

    // MARK: - Var

    /// Loading indicator 
    fileprivate var indicator = UIActivityIndicatorView()

    /// TableViewCell identifier
    private let reuseIdentifier = "openSourceCell"

    /// Contains all licence object before downloaded 
    var licences: [LicenceFile]?

    /// Contains all licences object after downloaded
    fileprivate var downloadedLicence: [LicenceFile]? {
        didSet {
            // Update UI 
            DispatchQueue.main.async {
                self.stopLoading()
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Lifecyle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Prepare tableview
        self.prepareTableView()

        // Download licences
        self.prepareLicences()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Prepare

    /// Download licences 
    fileprivate func prepareLicences() {
        if let licences = self.licences {
            self.startLoading()
            LicenceDownloader.downloadLicences(licences: licences) { () in
                // Update licences 
                self.downloadedLicence = self.licences
            }
        }
    }

    /// Init tableView dataSource, delegate, bar button & title
    fileprivate func prepareTableView() {
        // Common init
        self.tableView.tableFooterView = UIView()
        self.title = NSLocalizedString("Tiers library", comment: "")
        self.tableView.register(OpenSourceTableViewCell.self, forCellReuseIdentifier: self.reuseIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .singleLine

        // Close button (on the right corner of navigation bar)
        let closeButton = UIBarButtonItem(barButtonSystemItem: .stop,
                                          target: self,
                                          action: #selector(self.closePicker))
        self.navigationItem.rightBarButtonItem = closeButton

        // Loading indicator
        self.prepareActivityIndicator()
    }

    // MARK: - Loading indicator

    /// Prepare UIActivityIndicatorView and display it at the center of the view
    fileprivate func prepareActivityIndicator() {
        self.indicator = UIActivityIndicatorView(frame:CGRect(x: 0, y: 0, width: 40, height: 40) )
        self.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.indicator.center = self.view.center
        self.view.addSubview(indicator)
    }

    /// Start loading : start the loader animation 
    fileprivate func startLoading() {
        self.indicator.startAnimating()
        self.indicator.backgroundColor = UIColor.clear
        self.indicator.color = UIColor.black
        self.indicator.isHidden = false
    }

    /// Stop loading : stop and hide the loader
    fileprivate func stopLoading() {
        self.indicator.hidesWhenStopped = true
        self.indicator.stopAnimating()
        self.indicator.isHidden = true
    }

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.downloadedLicence?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier,
                                                 for: indexPath) as? OpenSourceTableViewCell
        if cell == nil {
            cell = OpenSourceTableViewCell(style: UITableViewCellStyle.default,
                                           reuseIdentifier: self.reuseIdentifier)
        }

        let libraryTitleAttribut = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize + 2)]
        let libraryLicenceAttribut = [NSFontAttributeName: UIFont.systemFont(ofSize: UIFont.systemFontSize)]
        let libraryTitle = NSMutableAttributedString(string: self.downloadedLicence?[indexPath.row].title ?? "",
                                                     attributes: libraryTitleAttribut)
        libraryTitle.append(NSAttributedString(string: "\n\n"))
        libraryTitle.append(NSAttributedString(string: self.downloadedLicence?[indexPath.row].detail ?? "",
                                               attributes: libraryLicenceAttribut))
        cell?.textLabel?.attributedText = libraryTitle

        return cell!
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    // MARK: - Action

    /// Handler for click on close button
    @objc fileprivate func closePicker() {
        self.dismissController()
    }

    // MARK: - Navigation

    /// Dismiss the OpenSourceController
    func dismissController() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
