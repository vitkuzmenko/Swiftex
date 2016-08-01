//
//  NSNotificationCenter+Extension.swift
//
//  Created by Vitaliy Kuzmenko on 08/01/15.
//  Copyright (c) 2015 Vitaliy Kuz'menko. All rights reserved.
//

import UIKit

extension NSNotificationCenter {

    public class func postNotificationName(name: String, object: AnyObject? = nil, userInfo: [NSObject : AnyObject]? = nil) {
        let nc = defaultCenter()
        nc.postNotificationName(name, object: object, userInfo: userInfo)
    }

}
