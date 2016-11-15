//
//  UIActivityIndicator+Extensions.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 15/11/2016.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    
    func startAnimating(hide view: UIView) {
        self.startAnimating()
        view.isHidden = true
    }
    
    func stopAnimating(show view: UIView) {
        self.stopAnimating()
        view.isHidden = false
    }
    
}
