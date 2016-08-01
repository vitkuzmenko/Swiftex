//
//  SwiftFuncExtension.swift
//
//  Created by Vitaliy Kuzmenko on 21/10/14.
//  Copyright (c) 2014 Vitaliy Kuz'menko. All rights reserved.
//

import Foundation

public func delay(delay: NSTimeInterval, closure:() -> Void) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}

