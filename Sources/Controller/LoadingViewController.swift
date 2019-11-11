//
//  LoadingViewController.swift
//  OpenSourceControllerDemo
//
//  Created by Florian Gabach on 23/10/2018.
//  Copyright © 2018 OpenSourceController. All rights reserved.
//

import UIKit

final class LoadingViewController: UIViewController {
    
    // MARK: - Var
    
    fileprivate lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            activityIndicator.style = UIActivityIndicatorView.Style.medium
        } else {
            activityIndicator.style = UIActivityIndicatorView.Style.gray
        }
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    fileprivate var config: OpenSourceControllerConfig
    
    // MARK: - Lifecycle
    
    init(configuration: OpenSourceControllerConfig) {
        self.config = configuration
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = self.config.uiConfig.backgroundColor
        
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator.pinCenter(to: self.view)
    }
}
