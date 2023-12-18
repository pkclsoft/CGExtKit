//
//  CGPointExtensions.swift
//
//  Created by Peter Easdown on 8/7/19.
//  Copyright © 2019 PKCLsoft. All rights reserved.
//

import Foundation
import CoreGraphics
#if canImport(GLKit)
import GLKit
#endif

public extension CGPoint {
    
    init(fromSize: CGSize) {
        self.init(x: fromSize.width, y: fromSize.height)
    }
    
    static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint.init(x: left.x - right.x, y: left.y - right.y)
    }
    
    /**
     * Decrements a CGPoint with the value of another.
     */
    static func -= (left: inout CGPoint, right: CGPoint) {
        left = left - right
    }

    static func += (left: inout CGPoint, right: CGPoint) {
        left = left + right
    }

    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint.init(x: left.x + right.x, y: left.y + right.y)
    }
    
    static func * (v: CGPoint, s: CGFloat) -> CGPoint {
        return CGPoint.init(x: v.x*s, y: v.y*s)
    }
    
    static func * (v: CGPoint, s: CGPoint) -> CGPoint {
        return CGPoint.init(x: v.x*s.x, y: v.y*s.y)
    }
    
    static func / (v: CGPoint, s: CGFloat) -> CGPoint {
        return CGPoint.init(x: v.x/s, y: v.y/s)
    }
    
    static func lerp(a: CGPoint, b: CGPoint, alpha:CGFloat) -> CGPoint {
        return (a * (1.0 - alpha)) + (b * alpha)
    }
    
    static func dot (left: CGPoint, right: CGPoint) -> CGFloat {
        return left.x*right.x + left.y*right.y;
        
    }
    
    static func / (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x / right.x, y: left.y / right.y)
    }
    
    func distanceTo(other: CGPoint) -> CGFloat {
        return  (self - other).lengthSQ().squareRoot()
    }
    
    func lengthSQ() -> CGFloat {
        return CGPoint.dot(left: self, right: self)
    }
    
    static func midpoint(betweenStart start: CGPoint, andEnd end: CGPoint) -> CGPoint {
        return .lerp(a: start, b: end, alpha: 0.5)
    }
    
    func midpointBetween(other: CGPoint) -> CGPoint {
        return .midpoint(betweenStart: self, andEnd: other)
    }
    
    func between(_ first: CGPoint, and second: CGPoint) -> Bool {
        // return false if self is at either extreme.  Can only return true if
        // self is between the two points.
        //
        if first == self || second == self {
            return false
        }
        
        if first.x == second.x {
            if first.x == self.x {
                if first.y < second.y {
                    return (first.y...second.y).contains(self.y)
                } else {
                    return (second.y...first.y).contains(self.y)
                }
            }
        } else if first.y == second.y {
            if first.y == self.y {
                if first.x < second.x {
                    return (first.x...second.x).contains(self.x)
                } else {
                    return (second.x...first.x).contains(self.x)
                }
            }
        }
        
        return false
    }
    
    /*!
     *  Calculates the angle from one point to another, in radians.
     */
    /// Calculates the angle from seld  to another point, in radians.
    /// - Parameter toPoint: The other point which provides the direction of the vector
    /// - Returns: An angle specifying the heading from self to toPoint.
    func angle(to toPoint: CGPoint) -> CGFloat {
        return CGVector(point: toPoint - self).angle
    }
    
    func radians(fromDegrees degrees: CGFloat) -> CGFloat {
        return degrees * (.pi/180.0)
    }
    
    /// Returns a coordinate on the circle surrounding self with the specified radius at an angle in degrees.
    /// - Parameters:
    ///   - radius: The radius of the circle in points
    ///   - atDegrees: The angle of the point from the center where 0.0 is north, and angles increase in a clockwise direction.
    /// - Returns: A coordinate.
    func pointOnCircle(withRadius radius: CGFloat, atDegrees: CGFloat) -> CGPoint {
        return pointOnCircle(withRadius: radius, atRadians: radians(fromDegrees: atDegrees.antiClockwiseAngle()))
    }
    
    /// Returns a coordinate on the circle surrounding self with the specified radius at an angle in degrees.
    /// - Parameters:
    ///   - radius: The radius of the circle in points
    ///   - atRadians: The angle of the point from the center where 0.0 is north, and angles increase in a clockwise direction.
    /// - Returns: A coordinate.
    func pointOnCircle(withRadius radius: CGFloat, atRadians: CGFloat) -> CGPoint {
        let xPos : CGFloat = CGFloat(radius + CGFloat(cos(atRadians)) * radius)
        let yPos : CGFloat = CGFloat(radius + CGFloat(sin(atRadians)) * radius)

        return self + (CGPoint.init(x: xPos, y: yPos) - CGPoint.init(x: radius, y: radius))
    }
    
    /// Returns a point on the Quadratic Bezier Curve between self and `toPoint` using the specified control point, and
    /// a interpolated using `alpha`.
    /// - Parameters:
    ///   - toPoint: the destination point
    ///   - controlPoint: the control point used to help generate the curve
    ///   - alpha: the linear position along the curve (0 .. 1.0)
    /// - Returns: A point along the curve.
    func lerpPointOnArc(toPoint: CGPoint, usingControlPoint controlPoint: CGPoint, alpha: CGFloat) -> CGPoint {
        let xPos = CGPoint.lerp(a: self, b: controlPoint, alpha: alpha)
        let yPos = CGPoint.lerp(a: controlPoint, b: toPoint, alpha: alpha)

        return CGPoint.lerp(a: xPos, b: yPos, alpha: alpha)
    }

#if canImport(GLKit)
    /// Computes the spherical polar coordinate corresponding to the input 3D vector on a sphere with the specified radius.
    /// - Parameters:
    ///   - vector3: The 3d vector defining  a cartesian coordinate.
    ///   - sphereRadius: The radius of the sphere on which the point should be computed.
    /// - Returns: A CGPoint containing a spherical polar coordinate where X is the effective longitude, and Y is the latitude.
    init(withCartesian3DCoordinate vector3: GLKVector3, andSphereRadius sphereRadius: CGFloat) {
        let theta = acosf(Float(CGFloat(vector3.y) / sphereRadius))
        let phi = atan2f(Float(vector3.z), Float(vector3.x))
        let halfPi = CGFloat.pi / 2.0

        // Return the angles, adjusted into spherical coordinates in the ranges:
        //
        //   -180 < theta < 180
        //    -90 < phi < 90
        //
        self.init(x: -(CGFloat(theta) - CGFloat.pi), y: -(halfPi - (halfPi - CGFloat(phi) - halfPi)))
    }

    func asCartesian3DCoordinate(withRadius sphereRadius: CGFloat) -> GLKVector3 {
        // First, adjust the angles back into:
        //   0 < theta < 360
        //   0 < phi < 180
        //
        let halfPi = CGFloat.pi / 2.0
        let phi   = Float(halfPi - self.y)
        let theta = Float(self.x + CGFloat.pi)
        
        // According to: https://www.omnicalculator.com/math/spherical-coordinates#converting-spherical-to-cartesian
        // where self.x = θ and self.y = φ
        //
        // x = r × sin θ × cos φ;
        // y = r × sin θ × sin φ;
        // z = r × cos θ.
        
        // According to: https://keisan.casio.com/exec/system/1359534351
        // where self.y = θ and self.x = ϕ
        //
        // x = r × sin ϕ × cos θ
        // y = r × sin ϕ × sin θ
        // z = r × cos ϕ
        

        let x = Float(Float(sphereRadius) * sinf(theta) * cosf(phi))
        let z = Float(Float(sphereRadius) * sinf(theta) * sinf(phi))
        let y = Float(Float(sphereRadius) * cosf(theta))

        return GLKVector3Make(x, y, z)
    }
    #endif
    
    /// Returns `true` is the point is within the polygon described by the input array of vertices.
    /// - Parameter vertices: An array of vertices defining a closed 2D polygon.
    /// - Returns: `true` if the point is within the polygon.
    func isInsidePolygon(vertices : [CGPoint]) -> Bool {
        var inside = false
        var i : Int = 0
        var j : Int = vertices.count-1

        while i < vertices.count {

            if (((vertices[i].y > self.y) != (vertices[j].y > self.y)) &&
                (self.x < (vertices[j].x - vertices[i].x) *
                    (self.y - vertices[i].y) /
                    (vertices[j].y - vertices[i].y) +
                    vertices[i].x)) {
                inside = !inside
            }

            j = i
            i += 1
        }

        return inside
    }
    
    /// Returns `true` is the point is within the specified rectangle.
    /// - Parameter rect: the rectangle to test
    /// - Returns: `true` is the poin tis within the rectangle.
    func isInside(rect: CGRect) -> Bool {
        return self.x >= rect.origin.x && self.x < rect.origin.x + rect.width && self.y >= rect.origin.y && self.y < rect.origin.y + rect.height
    }

}

// MARK: - Normalised positions

public extension CGPoint {
    
    /**
     * Converts self which is assumed to be a scene coordinate into a normalised position and returns it.
     * - Returns: a normalised version of self where the bounds of the scene become -1,-1 .. 1,1.
     */
    func normalisedPosition(_ forCentre: CGPoint) -> CGPoint {
        return self / forCentre
    }
    
    /**
     * Converts self which is assumed to be a normalised coordinate into a scene position and returns it.
     * - Returns: an unnormalised version of self where the bounds of the scene become -1,-1 .. 1,1.
     */
    func unnormalisedPosition(_ forCentre: CGPoint) -> CGPoint {
        return self * forCentre
    }

}

public extension CGFloat {
    
    static func lerp(a: CGFloat, b: CGFloat, x: CGFloat) -> CGFloat {
        return (a * (1.0 - x) + b * x)
    }
    
    /**
     * Assuming that self is an angle in degrees in a clockwise direction where 0.0 is north, returns an angle in degrees in an anticlockwise direction
     * where 0 is east.
     */
    func antiClockwiseAngle() -> CGFloat {
        return (450.0 - self).truncatingRemainder(dividingBy: 360.0)
    }


}
