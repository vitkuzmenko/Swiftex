//
//  SwiftFuncExtension.swift
//
//  Created by Vitaliy Kuzmenko on 21/10/14.
//  Copyright (c) 2014 Vitaliy Kuz'menko. All rights reserved.
//

import Foundation

public func delay(_ delay: TimeInterval, closure:@escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

