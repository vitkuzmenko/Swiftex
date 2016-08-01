//
//  NSData+Extension.swift
//  Wallet One
//
//  Created by Vitaliy Kuzmenko on 13/05/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

extension NSData {
    
    /// Recive string from APNS device token
    public var deviceTokenString: String {
        let charSet = NSCharacterSet(charactersInString: "<>")
        let string = self.description.stringByTrimmingCharactersInSet(charSet)
        return string.stringByReplacingOccurrencesOfString(" ", withString: "")
    }
    
}

