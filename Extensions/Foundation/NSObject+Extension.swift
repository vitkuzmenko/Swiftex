//
//  NSObject+Extension.swift
//  Wallet One
//
//  Created by Vitaliy Kuzmenko on 14/04/15.
//  Copyright (c) 2015 Wallet One. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#else
import Foundation
#endif

extension NSObject {
    
    public class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}

#if os(iOS) || os(tvOS) || os(watchOS)
    
@objc extension NSObject {

    // MARK: - Keyboard
    
    open func addKeyboardWillShowNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
    }
    
    open func addKeyboardDidShowNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: .UIKeyboardDidShow, object: nil)
    }
    
    open func addKeyboardWillHideNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    open func addKeyboardDidHideNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notification:)), name: .UIKeyboardDidHide, object: nil)
    }
    
    open func removeKeyboardWillShowNotification() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
    }
    
    open func removeKeyboardDidShowNotification() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidShow, object: nil)
    }
    
    open func removeKeyboardWillHideNotification() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    open func removeKeyboardDidHideNotification() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidHide, object: nil)
    }
    
    open func keyboardDidShow(notification: Notification) {
        guard let nInfo = notification.userInfo as? [String: Any], let value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
        keyboardDidShow(frame: value.cgRectValue)
    }
    
    open func keyboardWillShow(notification: Notification) {
        guard let nInfo = notification.userInfo as? [String: Any], let value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
        keyboardWillShow(frame: value.cgRectValue)
    }
    
    open func keyboardWillHide(notification: Notification) {
        guard let nInfo = notification.userInfo as? [String: Any], let value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
        keyboardWillHide(frame: value.cgRectValue)
    }
    
    open func keyboardDidHide(notification: Notification) {
        guard let nInfo = notification.userInfo as? [String: Any], let value = nInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
        keyboardDidHide(frame: value.cgRectValue)
    }
    
    open func keyboardWillShow(frame: CGRect) {
        
    }
    
    open func keyboardDidShow(frame: CGRect) {
        
    }
    
    open func keyboardWillHide(frame: CGRect) {
        
    }
    
    open func keyboardDidHide(frame: CGRect) {
        
    }
    
}

#endif
