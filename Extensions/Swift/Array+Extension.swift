//
//  Array+Extension.swift
//  LondonParis
//
//  Created by Vitaliy Kuzmenko on 14/03/16.
//  Copyright © 2016 London-Paris. All rights reserved.
//

import Foundation

extension Array {
    
    public var second: Element? {
        if count >= 2 {
            return self[1]
        } else {
            return nil
        }
    }
    
    public var third: Element? {
        if count >= 3 {
            return self[2]
        } else {
            return nil
        }
    }
    
}


extension Array where Element : Equatable {
    
    public func new(array: [Element]) -> [Element] {
        var new = [Element]()
        for object in array where !contains(object) {
            new.append(object)
        }
        return new
    }
    
    mutating public func add(object: Iterator.Element, atStart: Bool = false) {
        _ = remove(object)
        if atStart {
            insert(object, at: 0)
        } else {
            append(object)
        }
        
    }
    
    mutating public func move(fromPosition: Int, toPosition: Int) {
        let object = self[fromPosition]
        remove(at: fromPosition)
        insert(object, at: toPosition)
    }
    
    // Remove first collection element that is equal to the given `object`:
    mutating public func remove(_ object: Iterator.Element) -> Int? {
        if let index = self.index(of: object) {
            self.remove(at: index)
            return index
        }
        return nil
    }
    
    public func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
    
}
