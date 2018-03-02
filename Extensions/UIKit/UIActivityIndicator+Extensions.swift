//
//  UIActivityIndicator+Extensions.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 15/11/2016.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

//#if os(iOS) || os(watchOS)

import UIKit

extension UIActivityIndicatorView {
    
    public func startAnimating(hide view: UIView) {
        self.startAnimating()
        view.isHidden = true
    }
    
    public func stopAnimating(show view: UIView) {
        self.stopAnimating()
        view.isHidden = false
    }
    
}

//#endif

