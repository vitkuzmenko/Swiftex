//
//  UIViewController+Extension.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 19/08/16.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UIViewController {
    
    open var navigationBar: UINavigationBar? {
        return navigationController?.navigationBar
    }
    
    // MARK: - Notifications
    
    open func addKeyboardWillShowNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
    }
    
    open func addKeyboardDidShowNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardDidShow(notification:)), name: .UIKeyboardDidShow, object: nil)
    }
    
    open func addKeyboardWillHideNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    open func addKeyboardDidHideNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardDidHide(notification:)), name: .UIKeyboardDidHide, object: nil)
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
        let nInfo = (notification as NSNotification).userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        
        if let frame = value?.cgRectValue {
            keyboardDidShow(frame: frame)
        }
    }
    
    open func keyboardWillShow(notification: Notification) {
        let nInfo = (notification as NSNotification).userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        
        if let frame = value?.cgRectValue {
            keyboardWillShow(frame: frame)
        }
    }
    
    open func keyboardWillHide(notification: Notification) {
        let nInfo = (notification as NSNotification).userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        
        if let frame = value?.cgRectValue {
            keyboardWillHide(frame: frame)
        }
    }
    
    open func keyboardDidHide(notification: Notification) {
        let nInfo = (notification as NSNotification).userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        
        if let frame = value?.cgRectValue {
            keyboardDidHide(frame: frame)
        }
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
