//
//  CGSizeExtensions.swift
//
//  Created by Peter Easdown on 8/7/19.
//  Copyright © 2019 PKCLsoft. All rights reserved.
//

import Foundation
import CoreGraphics
#if canImport(GLKit)
import GLKit
#endif

public extension CGSize {
    
    static func - (left: CGSize, right: CGSize) -> CGSize {
        return CGSize.init(width: left.width - right.width, height: left.height - right.height)
    }
    
    static func + (left: CGSize, right: CGSize) -> CGSize {
        return CGSize.init(width: left.width + right.width, height: left.height + right.height)
    }
    
    static func * (v: CGSize, s: CGFloat) -> CGSize {
        return CGSize.init(width: v.width*s, height: v.height*s)
    }
    
    static func * (v: CGSize, s: CGSize) -> CGSize {
        return CGSize.init(width: v.width*s.width, height: v.height*s.height)
    }
    
    static func / (v: CGSize, s: CGFloat) -> CGSize {
        return CGSize.init(width: v.width/s, height: v.height/s)
    }
    
    static func lerp(a: CGSize, b: CGSize, alpha:CGFloat) -> CGSize {
        return (a * (1.0 - alpha)) + (b * alpha)
    }
    
    static func dot (left: CGSize, right: CGSize) -> CGFloat {
        return left.width*right.width + left.height*right.height;
        
    }
    
    func lengthSQ() -> CGFloat {
        return CGSize.dot(left: self, right: self)
    }
}
