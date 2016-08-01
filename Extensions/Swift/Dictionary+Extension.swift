//
//  Dictionary+Extension.swift
//  WOSDK
//
//  Created by Vitaliy Kuzmenko on 29/05/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

public func removeNilValuesFromDictionary(dictionary: [String: String?]) -> [String: String] {
    var cleanDictionary = [String: String]()
    for item in dictionary {
        if let value = item.1 {
            cleanDictionary[item.0] = value
        }
    }
    return cleanDictionary
}
