//
//  Array+Extension.swift
//  LondonParis
//
//  Created by Vitaliy Kuzmenko on 14/03/16.
//  Copyright © 2016 London-Paris. All rights reserved.
//

import Foundation
import CoreGraphics

extension Sequence where Iterator.Element == Int {
    
    public var strings: [String] {
        var strings: [String] = []
        for item in self {
            strings.append(item.toString)
        }
        return strings
    }
    
}

// MARK: - Sum

extension Sequence where Iterator.Element == CGFloat {
    
    public var sum: Iterator.Element {
        reduce(0) { (res, val) -> Iterator.Element in
            res + val
        }
    }
    
}

extension Sequence where Iterator.Element == Int {
    
    public var sum: Iterator.Element {
        reduce(0) { (res, val) -> Iterator.Element in
            res + val
        }
    }
    
}

extension Sequence where Iterator.Element == Double {
    
    public var sum: Iterator.Element {
        reduce(0) { (res, val) -> Iterator.Element in
            res + val
        }
    }
    
}

extension Sequence where Iterator.Element == Float {
    
    public var sum: Iterator.Element {
        reduce(0) { (res, val) -> Iterator.Element in
            res + val
        }
    }
    
}

// MARK: - Subtract

extension Sequence where Iterator.Element == CGFloat {
    
    public func subtract(_ start: Iterator.Element) -> Iterator.Element {
        reduce(start) { (res, val) -> Iterator.Element in
            res - val
        }
    }
    
}

extension Sequence where Iterator.Element == Int {
    
    public func subtract(_ start: Iterator.Element) -> Iterator.Element {
        reduce(start) { (res, val) -> Iterator.Element in
            res - val
        }
    }
    
}

extension Sequence where Iterator.Element == Double {
    
    public func subtract(_ start: Iterator.Element) -> Iterator.Element {
        reduce(start) { (res, val) -> Iterator.Element in
            res - val
        }
    }
    
}

extension Sequence where Iterator.Element == Float {
    
    public func subtract(_ start: Iterator.Element) -> Iterator.Element {
        reduce(start) { (res, val) -> Iterator.Element in
            res - val
        }
    }
    
}

// MARK: - Move

extension Array where Element : Equatable {
    
    mutating public func move(fromPosition: Int, toPosition: Int) {
        let object = self[fromPosition]
        remove(at: fromPosition)
        insert(object, at: toPosition)
    }
    
    // Remove first collection element that is equal to the given `object`:
    @discardableResult mutating public func remove(_ object: Iterator.Element) -> Int? {
        if let index = self.firstIndex(of: object) {
            self.remove(at: index)
            return index
        }
        return nil
    }
    
    mutating public func replace(object: Element, ifMissingInsertAt index: Int?) {
        if let currentIndex = self.remove(object) {
            self.insert(object, at: currentIndex)
        } else if let index = index {
            self.insert(object, at: index)
        } else {
            self.append(object)
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
