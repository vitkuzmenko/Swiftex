//
//  UIViewController+Extension.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 19/08/16.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var navigationBar: UINavigationBar? {
        return navigationController?.navigationBar
    }
    
    // MARK: - Notifications
    
    func addKeyboardWillShowNotification() {
        self.addNotificationObServer(UIKeyboardWillShowNotification, selector: #selector(UIViewController.keyboardWillShowNotification(_:)));
    }
    
    func addKeyboardDidShowNotification() {
        self.addNotificationObServer(UIKeyboardDidShowNotification, selector: #selector(UIViewController.keyboardDidShowNotification(_:)));
    }
    
    func addKeyboardWillHideNotification() {
        self.addNotificationObServer(UIKeyboardWillHideNotification, selector: #selector(UIViewController.keyboardWillHideNotification(_:)));
    }
    
    func addKeyboardDidHideNotification() {
        self.addNotificationObServer(UIKeyboardDidHideNotification, selector: #selector(UIViewController.keyboardDidHideNotification(_:)));
    }
    
    func removeKeyboardWillShowNotification() {
        self.removeNotificationObServer(UIKeyboardWillShowNotification);
    }
    
    func removeKeyboardDidShowNotification() {
        self.removeNotificationObServer(UIKeyboardDidShowNotification);
    }
    
    func removeKeyboardWillHideNotification() {
        self.removeNotificationObServer(UIKeyboardWillHideNotification);
    }
    
    func removeKeyboardDidHideNotification() {
        self.removeNotificationObServer(UIKeyboardDidHideNotification);
    }
    
    func keyboardDidShowNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardDidShowWithFrame(frame!)
    }
    
    func keyboardWillShowNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardWillShowWithFrame(frame!)
    }
    
    func keyboardWillHideNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardWillHideWithFrame(frame!)
    }
    
    func keyboardDidHideNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardDidHideWithFrame(frame!)
    }
    
    func keyboardWillShowWithFrame(frame: CGRect) {
        
    }
    
    func keyboardDidShowWithFrame(frame: CGRect) {
        
    }
    
    func keyboardWillHideWithFrame(frame: CGRect) {
        
    }
    
    func keyboardDidHideWithFrame(frame: CGRect) {
        
    }
    
}
