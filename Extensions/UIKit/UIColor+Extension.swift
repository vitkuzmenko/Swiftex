//
//  UIColor+Extension.swift
//  WOSDK
//
//  Created by Vitaliy Kuzmenko on 27/05/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

// #if os(iOS) || os(watchOS)

import UIKit

extension UIColor {
    
    public func hexString(prefix: Bool = false) -> String {
        let components = self.cgColor.components;
        let r = components?[0];
        let g = components?[1];
        let b = components?[2];
        let hexString = String(format: "%02X%02X%02X", Int(r! * 255), Int(g! * 255), Int(b! * 255))
        return hexString
    }
    
}

// #endif
