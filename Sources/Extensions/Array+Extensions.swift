//
//  Array+Extensions.swift
//  Pods
//
//  Created by Florian Gabach on 03/03/2017.

import Foundation

extension Array {
    /// Get an index safely 
    func get(at index: Int) -> Element? {
        guard index >= 0
            && index < count else {
                return nil
        }

        return self[index]
    }
}
