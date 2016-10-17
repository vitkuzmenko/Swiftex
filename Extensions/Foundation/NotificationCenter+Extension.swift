//
//  NSNotificationCenter+Extension.swift
//
//  Created by Vitaliy Kuzmenko on 08/01/15.
//  Copyright (c) 2015 Vitaliy Kuz'menko. All rights reserved.
//

import UIKit

extension NotificationCenter {

    public class func post(name: Notification.Name, object: Any? = nil, userInfo: [AnyHashable: Any]? = nil) {
        self.default.post(name: name, object: object, userInfo: userInfo)
    }

}
