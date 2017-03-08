//
//  OpenSourceControllerConfig.swift
//  Pods
//
//  Created by Florian Gabach on 08/03/2017.
//
//

/// Simple struct to hold settings 
public struct OpenSourceControllerConfig {

    /// Sub-stuct holding configuration relevant to UI presentation ! 
    public struct UIConfig {
        /// Will be applied to the navigation bar 
        public var barTintColor: UIColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1.0)

        /// Will be applied to the navigation bar 
        public var backgroundColor: UIColor = UIColor(red: 246/255.0, green: 246/255.0, blue: 246/255.0, alpha: 1.0)

        /// Will be applied to licence text
        public var licenceBackgroundColor: UIColor = UIColor.white

        /// Will be applied to the navigation bar 
        public var closeButtonColor: UIColor = UIColor.black

        /// Will be applied to licence text
        public var licenceTextColor: UIColor = UIColor.black

        /// Will be applied to licence text
        public var titleColor: UIColor = UIColor.black
    }

    /// Will be applied to the navigation bar title
    public var title: String = "Tiers library"

    /// UI-specific configuration.
    public var uiConfig = UIConfig()
}
