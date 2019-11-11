//
//  UIColor+Extension.swift
//  OpenSourceControllerDemo
//
//  Created by Florian Gabach on 11/11/2019.
//  Copyright © 2019 OpenSourceController. All rights reserved.
//

import UIKit

struct Style {
    static var background: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.systemBackground
        } else {
            return UIColor.black
        }
    }
    
    static var label: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.label
        } else {
            return UIColor.black
        }
    }
}
