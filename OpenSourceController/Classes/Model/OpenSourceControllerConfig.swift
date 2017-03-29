//
//  OpenSourceControllerConfig.swift
//  Pods
//
//  Created by Florian Gabach on 08/03/2017.

/// Simple struct to hold settings 
public struct OpenSourceControllerConfig {

    /// Sub-stuct holding configuration relevant to UI presentation ! 
    public struct UIConfig {
        /// Will be applied to the navigation bar 
        public var barTintColor: UIColor?

        /// Will be applied to the navigation bar 
        public var backgroundColor: UIColor?

        /// Will be applied to licence text
        public var licenceBackgroundColor: UIColor?

        /// Will be applied to the navigation bar 
        public var closeButtonColor: UIColor?

        /// Will be applied to licence text
        public var licenceTextColor: UIColor?

        /// Will be applied to licence text
        public var titleColor: UIColor?
    }

    /// Will be applied to the navigation bar title
    public var title: String = "Tiers library"

    // Verbose mode for print log when licence are downloaded
    public var verbose: Bool = false

    /// UI-specific configuration.
    public var uiConfig = UIConfig()
}
