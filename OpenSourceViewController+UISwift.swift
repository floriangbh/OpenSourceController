//
//  OpenSourceViewController+UISwift.swift
//  OpenSourceController
//
//  Created by Doron Katz on 1/28/20.
//  Copyright © 2020 OpenSourceController. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI
#endif

extension OpenSourceViewController{
    public struct OpenSourceView: UIViewControllerRepresentable {
        
        @available(iOS 13, *)
        public func updateUIViewController(_ uiViewController: OpenSourceViewController, context: UIViewControllerRepresentableContext<OpenSourceView>) {
            //
        }
        
        @available(iOS 13, *)
        public func makeUIViewController(context: UIViewControllerRepresentableContext<OpenSourceView>) -> OpenSourceViewController {
            let openSourceVC = OpenSourceViewController(licences:
                [LicenceFile(title: "MovieSwiftUI",
                             url: "https://raw.githubusercontent.com/Dimillian/MovieSwiftUI/master/LICENSE"),
                ],
                                                        showCloseButton: true,
                                                        configuration: OpenSourceControllerConfig(),
                                                        licenceLoader: LicenceLoader())
            return openSourceVC
        }
    }
}

