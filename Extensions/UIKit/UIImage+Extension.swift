//
//  UIImage+Utilites.swift
//  WhatToCook
//
//  Created by Vitaliy Kuzmenko on 20/09/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

//#if os(iOS) || os(watchOS)

import UIKit

extension UIImage {
        
    public func resize(newSize: CGSize) -> UIImage {
        let newRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height).integral
        var newImage: UIImage!
        
        let scale = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(newRect.size, false, 0.0);
        newImage = UIImage(cgImage: self.cgImage!, scale: scale, orientation: self.imageOrientation)
        newImage.draw(in: newRect)
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        let data = newImage.jpegData(compressionQuality: 0.9)
        let newI = UIImage(data: data!, scale: UIScreen.main.scale)
        
        return newI!
    }
    
    public func image(tintColor: UIColor) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height);
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, scale)
        
        draw(in: rect)
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx!.setBlendMode(CGBlendMode.sourceIn)
        
        ctx!.setFillColor(tintColor.cgColor)
        ctx!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext();
        
        return image!;
    }

}

// #endif

