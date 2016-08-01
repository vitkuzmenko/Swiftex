//
//  CGSize+Extension.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 01/08/16.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

import CoreGraphics

extension CGSize {
 
    public func aspectRatioForWidth(newWidth: CGFloat) -> CGSize {
        let newHeight = height * newWidth / width
        return CGSizeMake(ceil(newWidth), ceil(newHeight))
    }
    
    public func aspectRatioForHeight(newHeight: CGFloat) -> CGSize {
        let newWidth = width * newHeight / height
        return CGSizeMake(ceil(newWidth), ceil(newHeight))
    }
    
}