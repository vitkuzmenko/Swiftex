//
//  UINavigationItem+Extension.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 15/11/2016.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

#if os(iOS) || os(watchOS)

import UIKit

extension UINavigationItem {
    
    public enum ActivityViewPosition {
        case left, title, right
    }
    
    public func startAnimating(position: ActivityViewPosition, style: UIActivityIndicatorView.Style = .gray) {
        let activityView = UIActivityIndicatorView(style: style)
        let item = UIBarButtonItem(customView: activityView)
        switch position {
        case .left:
            self.leftBarButtonItem = item
            break
        case .title:
            self.titleView = activityView
            break
        case .right:
            self.rightBarButtonItem = item
            break
        }
        activityView.startAnimating()
    }
    
    public func stopAnimating(position: ActivityViewPosition, item: UIBarButtonItem? = nil) {
        switch position {
        case .left:
            self.leftBarButtonItem = item
            break
        case .title:
            self.titleView = nil
            break
        case .right:
            self.rightBarButtonItem = item
            break
        }
    }
    
}

#endif
