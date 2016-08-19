//
//  Array+Extension.swift
//  LondonParis
//
//  Created by Vitaliy Kuzmenko on 14/03/16.
//  Copyright © 2016 London-Paris. All rights reserved.
//

import Foundation

extension Array where Element : Equatable {
    
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
    
    mutating public func addObject(object: Generator.Element, atStart: Bool = false) {
        removeObject(object)
        if atStart {
            insert(object, atIndex: 0)
        } else {
            append(object)
        }
        
    }
    
    mutating public func moveObjectFromPosition(fromPosition: Int, toPosition: Int) {
        let object = self[fromPosition]
        removeAtIndex(fromPosition)
        insert(object, atIndex: toPosition)
    }
    
    // Remove first collection element that is equal to the given `object`:
    mutating public func removeObject(object : Generator.Element) -> Int? {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
            return index
        }
        return nil
    }
    
    public func hasObject(object : Generator.Element) -> Bool {
        return self.indexOf(object) != nil
    }
    
    public func hasObject(@noescape predicate: (Generator.Element) throws -> Bool) -> Bool {
        do {
            let index = try self.indexOf(predicate)
            return index != nil
        } catch _ {
            return false
        }
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

public protocol IdentifierHolder {
    var id: NSNumber { get set }
}

extension Array where Element : IdentifierHolder {
    
    public func idArray() -> [NSNumber] {
        var ids = [NSNumber]()
        for item in self {
            ids.append(item.id)
        }
        return ids
    }
    
    public func idArrayAsString() -> [String] {
        var ids = [String]()
        for item in self {
            ids.append(item.id.stringValue)
        }
        return ids
    }
    
}
