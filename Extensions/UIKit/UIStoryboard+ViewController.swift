//
//  UIStoryboard+ViewController.swift
//  Neyva
//
//  Created by Vitaly Kuzmenko on 26.03.2018.
//  Copyright © 2018 Faceter.io. All rights reserved.
//

#if os(iOS) || os(watchOS) || os(tvOS)

import UIKit

public protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension UIViewController: StoryboardIdentifiable { }

extension StoryboardIdentifiable where Self: UIViewController {
    
    public static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIStoryboard {
    
    public static func makeController<T: UIViewController>(_: T.Type, bundle: Bundle? = nil) -> T {
        let storyboard = UIStoryboard(name: T.storyboardIdentifier, bundle: bundle)
        return storyboard.instantiateViewController(T.self)
    }
    
    public func instantiateViewController<T: UIViewController>(_: T.Type) -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("View controller with \(T.storyboardIdentifier) not found")
        }
        
        return viewController
    }
    
    public func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("View controller with \(T.storyboardIdentifier) not found")
        }
        
        return viewController
    }
}

#endif
