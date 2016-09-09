//
//  CGSize+Extension.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 01/08/16.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

import CoreGraphics

extension CGSize {
 
    public func aspectRatio(newWidth: CGFloat) -> CGSize {
        let newHeight = height * newWidth / width
        return CGSize(width: ceil(newWidth), height: ceil(newHeight))
    }
    
    public func aspectRatio(newHeight: CGFloat) -> CGSize {
        let newWidth = width * newHeight / height
        return CGSize(width: ceil(newWidth), height: ceil(newHeight))
    }
    
}
