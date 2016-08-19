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
        self.addNotificationObServer(UIKeyboardWillShowNotification, selector: #selector(UIViewController.keyboardWillShowNotification(_:)));
    }
    
    public func addKeyboardDidShowNotification() {
        self.addNotificationObServer(UIKeyboardDidShowNotification, selector: #selector(UIViewController.keyboardDidShowNotification(_:)));
    }
    
    public func addKeyboardWillHideNotification() {
        self.addNotificationObServer(UIKeyboardWillHideNotification, selector: #selector(UIViewController.keyboardWillHideNotification(_:)));
    }
    
    public func addKeyboardDidHideNotification() {
        self.addNotificationObServer(UIKeyboardDidHideNotification, selector: #selector(UIViewController.keyboardDidHideNotification(_:)));
    }
    
    public func removeKeyboardWillShowNotification() {
        self.removeNotificationObServer(UIKeyboardWillShowNotification);
    }
    
    public func removeKeyboardDidShowNotification() {
        self.removeNotificationObServer(UIKeyboardDidShowNotification);
    }
    
    public func removeKeyboardWillHideNotification() {
        self.removeNotificationObServer(UIKeyboardWillHideNotification);
    }
    
    public func removeKeyboardDidHideNotification() {
        self.removeNotificationObServer(UIKeyboardDidHideNotification);
    }
    
    public func keyboardDidShowNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardDidShowWithFrame(frame!)
    }
    
    public func keyboardWillShowNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardWillShowWithFrame(frame!)
    }
    
    public func keyboardWillHideNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardWillHideWithFrame(frame!)
    }
    
    public func keyboardDidHideNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardDidHideWithFrame(frame!)
    }
    
    public func keyboardWillShowWithFrame(frame: CGRect) {
        
    }
    
    public func keyboardDidShowWithFrame(frame: CGRect) {
        
    }
    
    public func keyboardWillHideWithFrame(frame: CGRect) {
        
    }
    
    public func keyboardDidHideWithFrame(frame: CGRect) {
        
    }
    
}
