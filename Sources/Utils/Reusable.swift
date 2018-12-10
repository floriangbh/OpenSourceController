//
//  Reusable.swift
//  OpenSourceControllerDemo
//
//  Created by Florian Gabach on 10/12/2018.
//  Copyright © 2018 OpenSourceController. All rights reserved.
//

import Foundation

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
