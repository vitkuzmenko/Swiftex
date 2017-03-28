//
//  UIViewController+Extension.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 19/08/16.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)

import UIKit

extension UIViewController {
    
    open var navigationBar: UINavigationBar? {
        return navigationController?.navigationBar
    }
    
}

#endif
