//
//  NSObject+Extension.swift
//
//
//  Created by Vitaliy Kuzmenko on 14/04/15.
//  Copyright (c) 2015. All rights reserved.
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

#if os(iOS) || os(watchOS)
    
@objc extension NSObject {

    // MARK: - Keyboard
    
    open func addKeyboardWillShowNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    open func addKeyboardDidShowNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    open func addKeyboardWillHideNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    open func addKeyboardDidHideNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    open func addKeyboardWillUpdateNotification() {
        addKeyboardWillShowNotification()
        addKeyboardWillHideNotification()
    }
    
    open func addKeyboardDidUpdateNotification() {
        addKeyboardDidShowNotification()
        addKeyboardDidHideNotification()
    }
    
    open func removeKeyboardWillShowNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    open func removeKeyboardDidShowNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    open func removeKeyboardWillHideNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    open func removeKeyboardDidHideNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    open func keyboardDidShow(notification: Notification) {
        guard let nInfo = notification.userInfo as? [String: Any], let value = nInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        keyboardDidShow(frame: value.cgRectValue)
        keyboardDidUpdate(frame: value.cgRectValue)
    }
    
    open func keyboardWillShow(notification: Notification) {
        guard let nInfo = notification.userInfo as? [String: Any], let value = nInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        keyboardWillShow(frame: value.cgRectValue)
        keyboardWillUpdate(frame: value.cgRectValue)
    }
    
    open func keyboardWillHide(notification: Notification) {
        guard let nInfo = notification.userInfo as? [String: Any], let value = nInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        keyboardWillHide(frame: value.cgRectValue)
        keyboardWillUpdate(frame: .zero)
    }
    
    open func keyboardDidHide(notification: Notification) {
        guard let nInfo = notification.userInfo as? [String: Any], let value = nInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        keyboardDidHide(frame: value.cgRectValue)
        keyboardDidUpdate(frame: .zero)
    }
    
    open func keyboardWillShow(frame: CGRect) {
        
    }
    
    open func keyboardDidShow(frame: CGRect) {
        
    }
    
    open func keyboardWillHide(frame: CGRect) {
        
    }
    
    open func keyboardDidHide(frame: CGRect) {
        
    }
    
    open func keyboardWillUpdate(frame: CGRect) {
        
    }
    
    open func keyboardDidUpdate(frame: CGRect) {
        
    }
    
}

#endif
