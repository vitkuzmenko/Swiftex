//
//  UIView+Shake.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 15/11/2016.
//  Copyright © 2016 KuzmenkoFamily. All rights reserved.
//

#if os(iOS) || os(watchOS) || os(tvOS)

import UIKit

fileprivate func delay(_ delay: TimeInterval, closure:@escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

extension UIView {
    
    @IBInspectable public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    public func shakeZ(scale: CGFloat = 0.8, _ completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { (finished) -> Void in
            delay(0.3, closure: { () -> Void in
                completion?()
            })
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: UIView.AnimationOptions.curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (finished: Bool) -> Void in
                
            }
        })
    }
    
    public func shakeX(_ complete: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.05, animations: { () -> Void in
            self.transform = CGAffineTransform(translationX: 10, y: 0)
        }, completion: { (f) -> Void in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.7, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
                self.transform = .identity
            }, completion: complete)
        })
    }
    
}

public protocol UIViewNibLoadable: AnyObject {
    static func loadFromNib() -> Self?
}

extension UIViewNibLoadable where Self: UIView  {
    public static func loadFromNib() -> Self? {
        return Bundle.main.loadNibNamed(Self.nameOfClass, owner: nil, options: nil)?.first as? Self
    }
}

extension UIView: UIViewNibLoadable { }

#endif
