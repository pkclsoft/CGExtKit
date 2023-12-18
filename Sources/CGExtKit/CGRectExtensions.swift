//
//  CGRectExtensions.swift
//
//  Created by Peter Easdown on 8/7/19.
//  Copyright © 2019 PKCLsoft. All rights reserved.
//


import Foundation

public extension CGRect {
    
    func centerOf() -> CGPoint {
        return CGPoint.init(x:self.origin.x + (self.size.width / 2.0), y:self.origin.y + (self.size.height / 2.0))
    }
    
    /// Divides the rectangle by `s`, keeping the it centred on the same point.
    static func / (v: CGRect, s: CGFloat) -> CGRect {
        let newSize = v.size / s
        let newOrigin = CGPoint(x: v.origin.x + (v.size.width - newSize.width) / 2.0, y: v.origin.y + (v.size.height - newSize.height) / 2.0)
        
        return .init(origin: newOrigin, size: newSize)
   }
    
    /// Multiplies the rectangle `v` by `s`, keeping it centred on the same point.
    static func * (v: CGRect, s: CGFloat) -> CGRect {
        return v / (1.0 / s)
    }

}
