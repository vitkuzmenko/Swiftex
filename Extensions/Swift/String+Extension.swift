//
//  String+Utilites.swift
//  WhatToCook
//
//  Created by Виталий Кузьменко on 27/08/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//


import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
#elseif os(macOS)
    import Cocoa
#endif

extension String {

    public var trim: String {
        let charSet = CharacterSet.whitespacesAndNewlines
        return String(format: "%@", self.trimmingCharacters(in: charSet))
    }
    
    public var isEmail: Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    public var isAlphabet: Bool {
        let regEx = "[A-Za-z_]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    public var urlEncode: String {
        let originalString = self
        let escapedString = originalString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        return escapedString!
    }
    
    public var url: URL? {
        var URLString = self
        if URLString.hasPrefix("//") {
            URLString = "http:" + URLString
            if let URL = URL(string: URLString) {
                return URL
            }
        } else if let URL = URL(string: URLString) {
            return URL
        }
        return nil
    }
    
    public var localizedDecimalSeparator: String {
        let nf = NumberFormatter()
        if let separator = nf.decimalSeparator {
            var safeValue = self
            if separator == "," {
                safeValue = self.replacingOccurrences(of: ".", with: ",", options: [], range: nil)
            } else {
                safeValue = self.replacingOccurrences(of: ",", with: ".", options: [], range: nil)
            }
            return safeValue
        }
        return self
    }
    
    public var numbers: String {
        let set = CharacterSet.decimalDigits.inverted
        let numbers = self.components(separatedBy: set)
        return numbers.joined(separator: "")
    }
    
    public var letters: String {
        let set = CharacterSet.letters.inverted
        let letters = self.components(separatedBy: set)
        return letters.joined(separator: "")
    }
    
    public var lettersWithSpace: String {
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ").inverted
        let letters = self.components(separatedBy: set)
        return letters.joined(separator: "")
    }
    
    public var data: Data {
        return self.data(using: String.Encoding.utf8)!
    }
    
    public var range: NSRange {
        return NSRange(location: 0, length: self.utf16.count)
    }
    
}

extension String {
    
    public func enumCase<T: RawRepresentable>() -> T? {
        if let raw = self as? T.RawValue {
            return T(rawValue: raw)
        }
        return nil
    }
    
    public func matches(for regex: String) -> [[String]] {
        do {
            let regEx = try NSRegularExpression(pattern: regex, options: [])
            let matches = regEx.matches(in: self, range: NSRange(location: 0, length: self.count))
            return matches.map {
                var array: [String] = []
                for rangeIndex in 0...max(0, $0.numberOfRanges - 1) {
                    array.append(String(self[Range($0.range(at: rangeIndex), in: self)!]))
                }
                return array
            }
        } catch _ { }
        return []
    }
    
}

#if os(iOS) || os(tvOS) || os(watchOS)

extension String {
 
    func getAttributedStringFromHtml(font: UIFont, color: UIColor) -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else {
            return nil
        }
        
        guard let attributedString = try? NSMutableAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
            ) else {
                return nil
        }
        
        attributedString.addAttributes(
            [
                .font: font,
                .foregroundColor: color
            ],
            range: NSRange(location: 0, length: attributedString.length)
        )
        
        return attributedString
    }
    
}
    
extension String {
    
    public func size(font: UIFont) -> CGSize {
        let originalString = self as NSString
        return originalString.size(withAttributes: [NSAttributedString.Key.font: font])
    }
    
    public func width(font: UIFont) -> CGFloat {
        return size(font: font).width
    }
    
    public func height(width: CGFloat, withFont font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height) + 1
    }
}

extension NSAttributedString {

    public func height(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
        return ceil(boundingBox.height) + 1
    }
    
}

#endif
