//
//  UIViewController+Extension.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 19/08/16.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public var navigationBar: UINavigationBar? {
        return navigationController?.navigationBar
    }
    
    // MARK: - Notifications
    
    public func addKeyboardWillShowNotification() {
        self.addNotificationObServer(name: .UIKeyboardWillShow, selector: #selector(UIViewController.keyboardWillShow(notification:)));
    }
    
    public func addKeyboardDidShowNotification() {
        self.addNotificationObServer(name: .UIKeyboardDidShow, selector: #selector(UIViewController.keyboardDidShow(notification:)));
    }
    
    public func addKeyboardWillHideNotification() {
        self.addNotificationObServer(name: .UIKeyboardWillHide, selector: #selector(UIViewController.keyboardWillHide(notification:)));
    }
    
    public func addKeyboardDidHideNotification() {
        self.addNotificationObServer(name: .UIKeyboardDidHide, selector: #selector(UIViewController.keyboardDidHide(notification:)));
    }
    
    public func removeKeyboardWillShowNotification() {
        self.removeNotificationObServer(name: .UIKeyboardWillShow);
    }
    
    public func removeKeyboardDidShowNotification() {
        self.removeNotificationObServer(name: .UIKeyboardDidShow);
    }
    
    public func removeKeyboardWillHideNotification() {
        self.removeNotificationObServer(name: .UIKeyboardWillHide);
    }
    
    public func removeKeyboardDidHideNotification() {
        self.removeNotificationObServer(name: .UIKeyboardDidHide);
    }
    
    public func keyboardDidShow(notification: Notification) {
        let nInfo = (notification as NSNotification).userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        
        if let frame = value?.cgRectValue {
            keyboardDidShow(frame: frame)
        }
    }
    
    public func keyboardWillShow(notification: Notification) {
        let nInfo = (notification as NSNotification).userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        
        if let frame = value?.cgRectValue {
            keyboardWillShow(frame: frame)
        }
    }
    
    public func keyboardWillHide(notification: Notification) {
        let nInfo = (notification as NSNotification).userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        
        if let frame = value?.cgRectValue {
            keyboardWillHide(frame: frame)
        }
    }
    
    public func keyboardDidHide(notification: Notification) {
        let nInfo = (notification as NSNotification).userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        
        if let frame = value?.cgRectValue {
            keyboardDidHide(frame: frame)
        }
    }
    
    public func keyboardWillShow(frame: CGRect) {
        
    }
    
    public func keyboardDidShow(frame: CGRect) {
        
    }
    
    public func keyboardWillHide(frame: CGRect) {
        
    }
    
    public func keyboardDidHide(frame: CGRect) {
        
    }
    
}
