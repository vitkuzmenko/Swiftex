//
//  Actions.swift
//  Swiftex
//
//  Created by Vitaliy Kuzmenko on 13.05.2021.
//  Copyright © 2021 KuzmenkoFamily. All rights reserved.
//

import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#endif

public typealias VoidAction = () -> Void
extension String { public typealias Action = (Self) -> Void }
extension Int { public typealias Action = (Self) -> Void }
extension Bool { public typealias Action = (Self) -> Void }
extension Float { public typealias Action = (Self) -> Void }
extension Double { public typealias Action = (Self) -> Void }
extension URL { public typealias Action = (Self) -> Void }
extension Error { public typealias Action = (Self) -> Void }

#if os(iOS) || os(watchOS) || os(tvOS)
extension UIView { public typealias Action = (UIView) -> Void }
#endif
