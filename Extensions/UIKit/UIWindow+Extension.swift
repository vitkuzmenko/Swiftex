//
//  UIWindow+Extension.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 12/09/16.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UIWindow {
    
    public class var size: CGSize {
        if let size = UIApplication.shared.keyWindow?.bounds.size {
            return size
        } else {
            return .zero
        }
    }
    
}

