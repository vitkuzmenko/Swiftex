//
//  NSData+Extension.swift
// 
//
//  Created by Vitaliy Kuzmenko on 13/05/15.
//  Copyright (c) 2015. All rights reserved.
//

import Foundation

extension Data {
    
    /// Recive string from APNS device token
    public var deviceTokenAsString: String {
        return map { String(format: "%02.2hhx", $0) }.joined()
    }
    
}

