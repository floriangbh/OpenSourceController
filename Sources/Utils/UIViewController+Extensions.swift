//
//  UIViewController+Extensions.swift
//  OpenSourceControllerDemo
//
//  Created by Florian Gabach on 23/10/2018.
//  Copyright © 2018 OpenSourceController. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Child
    
    func add(_ child: UIViewController) {
        self.addChild(child)
        self.view.addSubview(child.view)
        view.pinEdges(to: child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        self.willMove(toParent: nil)
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
}
