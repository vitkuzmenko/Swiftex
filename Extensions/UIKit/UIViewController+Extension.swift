//
//  UIViewController+Extension.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 19/08/16.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

//#if os(iOS) || os(watchOS)

import UIKit

extension UIViewController {
    
    public func set(popoverSourceView: UIView) {
        popoverPresentationController?.sourceView = popoverSourceView.superview
        popoverPresentationController?.sourceRect = popoverSourceView.frame
    }
    
    public var safeAreaInsets: UIEdgeInsets {
        #if os(iOS)
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets
        } else {
            return UIEdgeInsets(top: topLayoutGuide.length, left: 0, bottom: bottomLayoutGuide.length, right: 0)
        }
        #elseif os(tvOS)
        
        if #available(tvOS 11.0, *) {
            return view.safeAreaInsets
        } else {
            return UIEdgeInsets(top: topLayoutGuide.length, left: 0, bottom: bottomLayoutGuide.length, right: 0)
        }
        #endif
    }
    
}

//#endif

