//
//  UIImage+Utilites.swift
//  WhatToCook
//
//  Created by Vitaliy Kuzmenko on 20/09/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UIImage {
        
    public func resizedImageWithSize(newSize: CGSize) -> UIImage {
        let newRect = CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height))
        var newImage: UIImage!
        
        let scale = UIScreen.mainScreen().scale
        
        UIGraphicsBeginImageContextWithOptions(newRect.size, false, 0.0);
        newImage = UIImage(CGImage: self.CGImage!, scale: scale, orientation: self.imageOrientation)
        newImage.drawInRect(newRect)
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        let data = UIImageJPEGRepresentation(newImage, 0.9)
        let newI = UIImage(data: data!, scale: UIScreen.mainScreen().scale)
        
        return newI!
    }
    

}
