//
//  UIView+Shake.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 15/11/2016.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)

import UIKit

extension UIView {
    
    public func shake(scale: CGFloat = 0.8, _ completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { (finished) -> Void in
            delay(0.3, closure: { () -> Void in
                completion?()
            })
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (finished: Bool) -> Void in
                
            }
        })
    }
    
    public func shakeHorisonal(_ complete: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.05, animations: { () -> Void in
            self.transform = CGAffineTransform(translationX: 10, y: 0)
        }, completion: { (f) -> Void in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                self.transform = .identity
            }, completion: complete)
        })
    }
    
}

#endif

