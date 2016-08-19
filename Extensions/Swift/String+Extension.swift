//
//  String+Utilites.swift
//  WhatToCook
//
//  Created by Виталий Кузьменко on 27/08/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//


import UIKit

extension String {

    public var trim: String {
        let charSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        return String(format: "%@", self.stringByTrimmingCharactersInSet(charSet))
    }
    
    public func contains(string: String) -> Bool {
        let innerLowercase = string.lowercaseString
        let selfLowercase = self.lowercaseString
        return (selfLowercase.rangeOfString(innerLowercase) != nil)
    }
    
    public var isEmail: Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluateWithObject(self)
    }
    
    public var isAlphabetString: Bool {
        let regEx = "[A-Za-z_]*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluateWithObject(self)
    }
    
    public var URLEncode: String {
        let originalString = self
        let escapedString = originalString.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        return escapedString!
    }
    
    public var URLValue: NSURL? {
        var URLString = self
        if URLString.hasPrefix("//") {
            URLString = "http:" + URLString
            if let URL = NSURL(string: URLString) {
                return URL
            }
        } else if let URL = NSURL(string: URLString) {
            return URL
        }
        return nil
    }
    
    public var localizeDecimalSeparator: String {
        let nf = NSNumberFormatter()
        if let separator = nf.decimalSeparator {
            var safeValue = self
            if separator == "," {
                safeValue = self.stringByReplacingOccurrencesOfString(".", withString: ",", options: [], range: nil)
            } else {
                safeValue = self.stringByReplacingOccurrencesOfString(",", withString: ".", options: [], range: nil)
            }
            return safeValue
        }
        return self
    }
    
    public var onlyNumbers: String {
        let set = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        let numbers = self.componentsSeparatedByCharactersInSet(set)
        return numbers.joinWithSeparator("")
    }
    
    public var onlyLetters: String {
        let set = NSCharacterSet.letterCharacterSet().invertedSet
        let letters = self.componentsSeparatedByCharactersInSet(set)
        return letters.joinWithSeparator("")
    }
    
    public var onlyLettersWithSpace: String {
        let set = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ").invertedSet
        let letters = self.componentsSeparatedByCharactersInSet(set)
        return letters.joinWithSeparator("")
    }
    
    public var dataValue: NSData {
        return self.dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    public func lastCharactersOfString(count: Int) -> String {
        if count >= self.length {
            return self
        } else {
            return self.substringFromIndex(self.endIndex.advancedBy(-count))
        }
    }
    
    public var decodeHTMLEntitles: String {
        
        let encodedString = self
        
        let encodedData = encodedString.dataUsingEncoding(NSUTF8StringEncoding)!
        let attributedOptions : [String: AnyObject] = [
            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
            NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
        ]
        
        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            let decodedString = attributedString.string
            return decodedString
        } catch _ {
            return encodedString
        }
    }
    
    public var stringByStrippingHTML: String {
        var string = self
        let charactersToReplace = ["<br>", "<br />", "<br/>", "</p>"]
        
        for charater in charactersToReplace {
            string = string.stringByReplacingOccurrencesOfString(charater, withString: "\n", options: [], range: nil)
        }
        
        string = string.stringByReplacingOccurrencesOfString("</li>", withString: ";", options: [], range: nil)
        
        while let range = string.rangeOfString("<[^>]+>", options: .RegularExpressionSearch, range: nil, locale: nil) {
            string = string.stringByReplacingCharactersInRange(range, withString: "")
        }
        
        string = string.stringByReplacingOccurrencesOfString("\n\n", withString: "\n", options: [], range: nil).trim
        
        return string
    }
    
    public var range: NSRange {
        return NSRange(location: 0, length: self.utf16.count)
    }
    
    public var stringWithoutHTML: String? {
        do {
            let pattern = "<a\\b.*?<\\/a>"
            let reg = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
            let result = reg.stringByReplacingMatchesInString(self, options: [], range: range, withTemplate: "")
            return result.length > 0 ? result : nil
        } catch _ {
            return self
        }
    }
    
    public var first: String {
        return String(characters.prefix(1))
    }
    
    public var last: String {
        return String(characters.suffix(1))
    }
    
    public var uppercaseFirst: String {
        return first.uppercaseString + String(characters.dropFirst())
    }
    
    public func truncate(length: Int, trailing: String? = nil) -> String {
        if self.characters.count > length {
            return self.substringToIndex(self.startIndex.advancedBy(length)).trim + (trailing ?? "")
        } else {
            return self
        }
    }
    
}

// MARK: - Subcript

extension String {
    
    public subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    public subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    public subscript (r: Range<Int>) -> String {
        return substringWithRange(startIndex.advancedBy(r.startIndex)..<startIndex.advancedBy(r.endIndex))
    }
    
}

extension String {
    
    public var length: Int {
        return self.characters.count
    }
    
}

public extension String {
    
    public func enumCase<T: RawRepresentable>() -> T? {
        if let raw = self as? T.RawValue {
            return T(rawValue: raw)
        }
        return nil
    }
    
}

/**
 *  Calculating String Size
 */
extension String {
    
    public func sizeWithFont(font: UIFont) -> CGSize {
        let originalString = self as NSString
        return originalString.sizeWithAttributes([NSFontAttributeName: font])
    }
    
    public func widthWithFont(font: UIFont) -> CGFloat {
        return sizeWithFont(font).width
    }
    
    public func heightForWidth(width: CGFloat, withFont font: AnyObject) -> CGFloat {
        
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return ceil(boundingBox.height) + 1
        
    }
    
}
