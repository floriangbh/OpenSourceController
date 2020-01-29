//
//  LicenceHTTPLoader.swift
//  OpenSourceControllerDemo
//
//  Created by Florian Gabach on 24/10/2018.
//  Copyright © 2018 OpenSourceController. All rights reserved.
//

import Foundation

open class HTTPDataLoader {
    func loadData(fromUrl url: String, completion: @escaping (Data?) -> Void) {
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                if error != nil {
                    print("OpenSourceController error : \(error?.localizedDescription ?? "") from url : \(url)")
                }
                completion(data)
            }
            task.resume()
        }
    }
}
