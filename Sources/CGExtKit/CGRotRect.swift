//
//  CGRotRect.swift
//
//
//  Created by Peter Easdown on 14/3/2024.
//

import Foundation

/// Provides a simple representation of a rotated rectangle for use in the intersection method by Orem Becker.
///
public struct CGRotRect {
    
    /// The  unrotated rectangle
    public var rect : CGRect
    
    /// The angle in radians by which it has been rotated
    public var rotation: CGFloat
    
    /// Initialises the struct.
    /// - Parameters:
    ///   - rect: the raw unrotated rectangle
    ///   - rotation: the angle of rotation in radians
    public init(rect: CGRect, rotation: CGFloat) {
        self.rect = rect
        self.rotation = rotation
    }
    
    /// The origin of the rectangle
    public var origin : CGPoint {
        get {
            return rect.origin
        }
    }
    
    /// The size of the rectangle
    public var size : CGSize {
        get {
            return rect.size
        }
    }
    
    /// The width of the rectangle
    public var width : CGFloat {
        get {
            return rect.size.width
        }
    }
    
    /// The height of the rectangle
    public var height : CGFloat {
        get {
            return rect.size.height
        }
    }
    
    /// Rotated Rectangles Collision Detection, Oren Becker, 2001
    ///
    /// http://www.ragestorm.net/tutorial?id=22
    ///
    /// Returns `true` if the self is deterrmined to intersect the other rotated rectangle
    /// - Parameter other: the other rotated rectangle
    /// - Returns: `Bool` containing `true` if the two rotated rectangles intersect
    public func intersects(other: CGRotRect) -> Bool {
        var A  : CGPoint
        var B  : CGPoint // vertices of the rotated rr2
        var C  : CGPoint // center of rr2
        var BL : CGPoint
        var TR : CGPoint // vertices of rr2 (bottom-left, top-right)
        
        let ang : CGFloat = self.rotation - other.rotation   // orientation of rotated rr1
        let cosa : CGFloat = cos(ang)           // precalculated trigonometic -
        let sina : CGFloat = sin(ang)           // - values for repeated use
        
        var t : CGFloat
        var x : CGFloat
        var a : CGFloat      // temporary variables for various uses
        var dx : CGFloat     // deltaX for linear equations
        var ext1 : CGFloat
        var ext2 : CGFloat   // min/max vertical values
        
        // move rr2 to make rr1 cannonic
        C = other.rect.origin - other.rect.origin
        
        // rotate rr2 clockwise by rr2->ang to make rr2 axis-aligned
        C = C.rotated(byAngle: other.rotation)
        
        // calculate vertices of (moved and axis-aligned := 'ma') rr2
        BL = C - CGPoint(fromSize: other.size / 2.0)
        TR = C + CGPoint(fromSize: other.size / 2.0)
        
        // calculate vertices of (rotated := 'r') rr1
        A = CGPoint(x: -(self.height / 2) * sina, y: (self.height / 2) * cosa)
        B = A
        t = (self.width / 2) * cosa
        A.x += t
        B.x -= t
        t = (self.width / 2) * sina
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
        return !((ext1 < BL.y && ext2 < BL.y) || (ext1 > TR.y && ext2 > TR.y))
    }

}
