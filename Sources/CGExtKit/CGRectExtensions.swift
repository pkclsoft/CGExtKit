//
//  CGRectExtensions.swift
//
//  Created by Peter Easdown on 8/7/19.
//  Copyright © 2023 PKCLsoft. All rights reserved.
//


import Foundation

public extension CGRect {
    
    /// Returns a `CGPoint` representing the centre of the rectangle `self`.
    /// - Returns: A `CGPoint`.
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
    
    struct CGRotRect {
        var rect : CGRect
        var rotation: CGFloat
        
        var origin : CGPoint {
            get {
                return rect.origin
            }
        }
        
        var size : CGSize {
            get {
                return rect.size
            }
        }
        
        var width : CGFloat {
            get {
                return rect.size.width
            }
        }
        
        var height : CGFloat {
            get {
                return rect.size.height
            }
        }
    }
    
    // Rotated Rectangles Collision Detection, Oren Becker, 2001
    //
    // http://www.ragestorm.net/tutorial?id=22
    //
    func intersect(rr1: CGRotRect, rr2: CGRotRect) -> Bool {
        var A  : CGPoint
        var B  : CGPoint // vertices of the rotated rr2
        var C  : CGPoint // center of rr2
        var BL : CGPoint
        var TR : CGPoint // vertices of rr2 (bottom-left, top-right)
        
        var ang : CGFloat = rr1.rotation - rr2.rotation   // orientation of rotated rr1
        var cosa : CGFloat = cos(ang)           // precalculated trigonometic -
        var sina : CGFloat = sin(ang)           // - values for repeated use
        
        var t : CGFloat
        var x : CGFloat
        var a : CGFloat      // temporary variables for various uses
        var dx : CGFloat     // deltaX for linear equations
        var ext1 : CGFloat
        var ext2 : CGFloat   // min/max vertical values
        
        // move rr2 to make rr1 cannonic
        C = rr2.rect.origin - rr2.rect.origin
        
        // rotate rr2 clockwise by rr2->ang to make rr2 axis-aligned
        C = C.rotated(byAngle: rr2.rotation)
        
        // calculate vertices of (moved and axis-aligned := 'ma') rr2
        BL = C - CGPoint(fromSize: rr2.size / 2.0)
        TR = C + CGPoint(fromSize: rr2.size / 2.0)
        
        // calculate vertices of (rotated := 'r') rr1
        A = CGPoint(x: -(rr1.height / 2) * sina, y: (rr1.height / 2) * cosa)
        B = A
        t = (rr1.width / 2) * cosa
        A.x += t
        B.x -= t
        t = (rr1.width / 2) * sina
        A.y += t
        B.y -= t
        
        t = sina*cosa
        
        // verify that A is vertical min/max, B is horizontal min/max
        if (t < 0) {
            t = A.x
            A.x = B.x
            B.x = t
            t = A.y
            A.y = B.y
            B.y = t
        }
        
        // verify that B is horizontal minimum (leftest-vertex)
        if (sina < 0) {
            B.x = -B.x
            B.y = -B.y
        }
        
        // if rr2(ma) isn't in the horizontal range of
        // colliding with rr1(r), collision is impossible
        if (B.x > TR.x || B.x > -BL.x) {
            return false
        }
        
        // if rr1(r) is axis-aligned, vertical min/max are easy to get
        if (t == 0) {
            ext1 = A.y
            ext2 = -ext1
        } else {
            // else, find vertical min/max in the range [BL.x, TR.x]
            x = BL.x-A.x
            a = TR.x-A.x
            ext1 = A.y
            
            // if the first vertical min/max isn't in (BL.x, TR.x), then
            // find the vertical min/max on BL.x or on TR.x
            if (a*x > 0) {
                dx = A.x
                if (x < 0) {
                    dx -= B.x
                    ext1 -= B.y
                    x = a
                } else {
                    dx += B.x
                    ext1 += B.y
                }
                
                ext1 *= x
                ext1 /= dx
                ext1 += A.y
            }
            
            x = BL.x+A.x
            a = TR.x+A.x
            ext2 = -A.y
            
            // if the second vertical min/max isn't in (BL.x, TR.x), then
            // find the local vertical min/max on BL.x or on TR.x
            if (a*x > 0) {
                dx = -A.x
                
                if (x < 0) {
                    dx -= B.x
                    ext2 -= B.y
                    x = a
                } else {
                    dx += B.x
                    ext2 += B.y
                }
                
                ext2 *= x
                ext2 /= dx
                ext2 -= A.y
            }
        }
        
        // check whether rr2(ma) is in the vertical range of colliding with rr1(r)
        // (for the horizontal range of rr2)
        var result : Bool = !((ext1 < BL.y && ext2 < BL.y) || (ext1 > TR.y && ext2 > TR.y))
        
        return result
    }
}
