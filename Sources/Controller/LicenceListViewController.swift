//
//  LicenceListViewController.swift
//  OpenSourceControllerDemo
//
//  Created by Florian Gabach on 23/10/2018.
//  Copyright © 2018 OpenSourceController. All rights reserved.
//

import UIKit

final class LicenceListViewController: UITableViewController {
    
    // MARK: - Var

    fileprivate let reuseIdentifier = "openSourceCell"
    
    fileprivate var config: OpenSourceControllerConfig

    fileprivate var downloadedLicence: [LicenceFile]
    
    // MARK: - Lifecyle
    
    init(downloadedLicence: [LicenceFile], config: OpenSourceControllerConfig) {
        self.config = config
        self.downloadedLicence = downloadedLicence
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareTableView()
    }
    
    // MARK: - Prepare
    
    fileprivate func prepareTableView() {
        self.tableView.tableFooterView = UIView()
        self.tableView.register(OpenSourceTableViewCell.self, forCellReuseIdentifier: self.reuseIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .singleLine
        self.tableView.backgroundColor = self.config.uiConfig.backgroundColor
    }
}
    
extension LicenceListViewController {
    
    // MARK: - Table View Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.downloadedLicence.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier,
                                                 for: indexPath) as? OpenSourceTableViewCell
        // Init cell
        if cell == nil {
            cell = OpenSourceTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: self.reuseIdentifier)
        }
        
        // Configure the cell with licence
        if let licence = self.downloadedLicence.get(at: indexPath.row) {
            cell?.configure(licence: licence, config: self.config)
        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
