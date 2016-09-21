//
//  Dictionary+Extension.swift
//  WOSDK
//
//  Created by Vitaliy Kuzmenko on 29/05/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

import Foundation

public func removeNilValuesFromString(dictionary: [String: String?]) -> [String: String] {
    var cleanDictionary = [String: String]()
    for item in dictionary {
        if let value = item.1 {
            cleanDictionary[item.0] = value
        }
    }
    return cleanDictionary
}

public func removeNilValues<T: Any>(dictionary: [String: T?]) -> [String: T] {
    var cleanDictionary = [String: T]()
    for item in dictionary {
        if let value = item.1 {
            cleanDictionary[item.0] = value
        }
    }
    return cleanDictionary
}
