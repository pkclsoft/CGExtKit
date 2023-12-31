//
//  CGVectorExtensions.swift
//
//  Created by Peter Easdown on 8/7/19.
//  Copyright © 2023 PKCLsoft. All rights reserved.
//


import Foundation
import CoreGraphics

public extension CGVector {
    /**
     * Creates a new CGVector given a CGPoint.
     */
    init(point: CGPoint) {
        self.init(dx: point.x, dy: point.y)
    }
    
    /**
     * Given an angle in radians, creates a vector of length 1.0 and returns the
     * result as a new CGVector. An angle of 0 is assumed to point to the right.
     */
    init(angle: CGFloat) {
        self.init(dx: cos(angle), dy: sin(angle))
    }
    
    /**
     * Adds (dx, dy) to the vector.
     */
    mutating func offset(dx: CGFloat, dy: CGFloat) -> CGVector {
        self.dx += dx
        self.dy += dy
        return self
    }
    
    /**
     * Returns the length (magnitude) of the vector described by the CGVector.
     */
    func length() -> CGFloat {
        return sqrt(dx*dx + dy*dy)
    }
    
    /**
     * Returns the squared length of the vector described by the CGVector.
     */
    func lengthSquared() -> CGFloat {
        return dx*dx + dy*dy
    }
    
    /**
     * Normalizes the vector described by the CGVector to length 1.0 and returns
     * the result as a new CGVector.
     */
    func normalized() -> CGVector {
        let len = length()
        return len>0 ? self / len : CGVector.zero
    }
    
    /**
     * Normalizes the vector described by the CGVector to length 1.0.
     */
    mutating func normalize() -> CGVector {
        self = normalized()
        return self
    }
    
    /**
     * Calculates the distance between two CGVectors. Pythagoras!
     */
    func distanceTo(_ vector: CGVector) -> CGFloat {
        return (self - vector).length()
    }
    
    /**
     * Returns the angle in radians of the vector described by the CGVector.
     * The range of the angle is -π to π; an angle of 0 points to the right.
     */
    var angle: CGFloat {
        return atan2(dy, dx)
    }
    
    /**
     * Adds two CGVector values and returns the result as a new CGVector.
     */
    static func + (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }
    
    /**
     * Increments a CGVector with the value of another.
     */
    static func += (left: inout CGVector, right: CGVector) {
        left = left + right
    }
    
    /**
     * Subtracts two CGVector values and returns the result as a new CGVector.
     */
    static func - (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }
    
    /**
     * Decrements a CGVector with the value of another.
     */
    static func -= (left: inout CGVector, right: CGVector) {
        left = left - right
    }
    
    /**
     * Multiplies two CGVector values and returns the result as a new CGVector.
     */
    static func * (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx * right.dx, dy: left.dy * right.dy)
    }
    
    /**
     * Multiplies a CGVector with another.
     */
    static func *= (left: inout CGVector, right: CGVector) {
        left = left * right
    }
    
    /**
     * Multiplies the x and y fields of a CGVector with the same scalar value and
     * returns the result as a new CGVector.
     */
    static func * (vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    /**
     * Multiplies the x and y fields of a CGVector with the same scalar value.
     */
    static func *= (vector: inout CGVector, scalar: CGFloat) {
        vector = vector * scalar
    }
    
    /**
     * Divides two CGVector values and returns the result as a new CGVector.
     */
    static func / (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx / right.dx, dy: left.dy / right.dy)
    }
    
    /**
     * Divides a CGVector by another.
     */
    static func /= (left: inout CGVector, right: CGVector) {
        left = left / right
    }
    
    /**
     * Divides the dx and dy fields of a CGVector by the same scalar value and
     * returns the result as a new CGVector.
     */
    static func / (vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx / scalar, dy: vector.dy / scalar)
    }
    
    /**
     * Divides the dx and dy fields of a CGVector by the same scalar value.
     */
    static func /= (vector: inout CGVector, scalar: CGFloat) {
        vector = vector / scalar
    }
    
    /**
     * Performs a linear interpolation between two CGVector values.
     */
    static func lerp(a: CGVector, b: CGVector, alpha: CGFloat) -> CGVector {
        return a.lerp(toB: b, alpha: alpha)
    }
    
    /**
     * Performs a linear interpolation between two CGVector values.
     */
    func lerp(toB b: CGVector, alpha: CGFloat) -> CGVector {
        return self + (b - self) * alpha
    }
}
