//
//  UIViewController+Extension.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 19/08/16.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

#if os(iOS) || os(watchOS)

import UIKit

extension UIViewController {
    
    func set(popoverSourceView: UIView) {
        popoverPresentationController?.sourceView = popoverSourceView.superview
        popoverPresentationController?.sourceRect = popoverSourceView.frame
    }
    
}

#endif
