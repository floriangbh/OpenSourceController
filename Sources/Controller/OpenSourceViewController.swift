//
//  OpenSourceViewController.swift
//  Pods
//
//  Created by Florian Gabach on 05/02/2017.

import UIKit

class OpenSourceViewController: UITableViewController {
    
    // MARK: - Var
    
    /// Loading indicator 
    fileprivate lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame:CGRect(x: 0,
                                                             y: 0,
                                                             width: 40,
                                                             height: 40) )
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicator.hidesWhenStopped = true
        indicator.backgroundColor = UIColor.clear
        indicator.color = UIColor.black
        return indicator
    }()
    
    /// TableViewCell identifier
    private let reuseIdentifier = "openSourceCell"
    
    /// Contains all licence object before downloaded 
    internal var licences: [LicenceFile]?
    
    /// Controller configuration for customization
    internal var config = OpenSourceControllerConfig()
    
    /// Do we need to show the close button ? (disable if push the controller)
    internal var showCloseButton: Bool = true
    
    /// Contains all licences object after downloaded
    fileprivate var downloadedLicence: [LicenceFile]? {
        didSet {
            // Update UI 
            DispatchQueue.main.async { [weak self] in 
                self?.stopLoading()
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Prepare controller
        self.prepare()
    }
    
    // MARK: - Prepare
    
    /// Prepare controller
    fileprivate func prepare() {
        self.prepareTableView()
        self.prepareActivityIndicator()
        
        if showCloseButton {
            self.prepareCloseButton()
        }
        
        self.prepareStyle()
        self.prepareLicences()
    }
    
    /// Download licences 
    fileprivate func prepareLicences() {
        self.startLoading()
        
        // Retrieve licence
        guard let licences = self.licences else {
            print("No licences found.")
            return
        }
        
        // Download licence
        LicenceDownloader.downloadLicences(licences: licences,
                                           config: self.config) { () in
                                            // Update licences
                                            self.downloadedLicence = self.licences
        }
    }
    
    /// Init tableView dataSource, delegate, bar button & title
    fileprivate func prepareTableView() {
        // Common init
        self.tableView.tableFooterView = UIView()
        self.tableView.register(OpenSourceTableViewCell.self, forCellReuseIdentifier: self.reuseIdentifier)
        self.title = self.config.title
        self.tableView.register(OpenSourceTableViewCell.self,
                                forCellReuseIdentifier: self.reuseIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .singleLine
        
        // Apply background color from configuration if needed
        if let backgroundColor = self.config.uiConfig.backgroundColor {
            self.tableView.backgroundColor = backgroundColor
        }
    }
    
    /// Prepare controller style
    fileprivate func prepareStyle() {
        // Apply navigation bar tint color if needed
        if let tintColor = self.config.uiConfig.barTintColor {
            self.navigationController?.navigationBar.barTintColor = tintColor
        }
        
        // Applu navigation bar text color if needed
        if let textColor = self.config.uiConfig.titleColor {
            let attribut = [NSAttributedStringKey.foregroundColor: textColor]
            self.navigationController?.navigationBar.titleTextAttributes = attribut
        }
    }
    
    /// Prepare close button on navigation bar 
    fileprivate func prepareCloseButton() {
        // Close button (on the right corner of navigation bar)
        let closeButton = UIBarButtonItem(barButtonSystemItem: .stop,
                                          target: self,
                                          action: #selector(self.closePicker))
        closeButton.tintColor = config.uiConfig.closeButtonColor ?? UIColor.black
        self.navigationItem.rightBarButtonItem = closeButton
    }
    
    // MARK: - Loading indicator
    
    /// Prepare UIActivityIndicatorView and display it at the center of the view
    fileprivate func prepareActivityIndicator() {
        // Add to view
        self.view.addSubview(indicator)
        
        // Apply constraint
        self.indicator.translatesAutoresizingMaskIntoConstraints = false
        self.indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let topConstraint = self.navigationController?.navigationBar.frame.size.height ?? 0.0
        self.indicator.bottomAnchor.constraint(equalTo: view.topAnchor, constant: topConstraint).isActive=true
    }
    
    /// Start loading : start the loader animation 
    fileprivate func startLoading() {
        self.indicator.startAnimating()
        self.indicator.isHidden = false
        
        // Disable scroll 
        self.tableView.isScrollEnabled = false
    }
    
    /// Stop loading : stop and hide the loader
    fileprivate func stopLoading() {
        self.indicator.stopAnimating()
        self.indicator.isHidden = true
        
        // Enable scroll 
        self.tableView.isScrollEnabled = true
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
        // Init cell
        if cell == nil {
            cell = OpenSourceTableViewCell(style: UITableViewCellStyle.default,
                                           reuseIdentifier: self.reuseIdentifier)
        }
        
        // Configure the cell with licence 
        if let licence = self.downloadedLicence?.get(at: indexPath.row) {
            cell?.configure(licence: licence, config: self.config)
        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // Automatic dimension 
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
        DispatchQueue.main.async { [weak self] in 
            self?.dismiss(animated: true, completion: nil)
        }
    }
}
