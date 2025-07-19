//
//  CGPointExtensionTests.swift
//  
//
//  Created by Peter Easdown on 31/1/2023.
//

import XCTest
import GLKit
import CoreGraphics
import CGExtKit

final class CGPointExtensionTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func checkPointsMatch(p1: CGPoint, p2: CGPoint) {
        XCTAssertEqual(p1.x, p2.x, accuracy: 0.005)
        XCTAssertEqual(p1.y, p2.y, accuracy: 0.005)
    }
    
    func testCGPointFromCGSize() {
        let p1 = CGPoint(fromSize: CGSize(width: 4.5, height: 17.5))
        let correctResult = CGPoint(x: 4.5, y: 17.5)
        
        checkPointsMatch(p1: p1, p2: correctResult)
    }
    
    func testCGPointFromCGVector() {
        let p1 = CGPoint(withVector: CGVector(dx: 4.5, dy: 17.5))
        let correctResult = CGPoint(x: 4.5, y: 17.5)
        
        checkPointsMatch(p1: p1, p2: correctResult)
    }
    
    func testCGPointMinus() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        let result = p1 - p2
        let correctResult = CGPoint(x: 4 - 17.5, y: 5 - 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointMinusVector() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        let result = p1 - p2
        let correctResult = CGPoint(x: 4 - 17.5, y: 5 - 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointMinusEquals() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        var result = p1
        result -= p2
        let correctResult = CGPoint(x: 4 - 17.5, y: 5 - 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointMinusVectorEquals() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        var result = p1
        result -= p2
        let correctResult = CGPoint(x: 4 - 17.5, y: 5 - 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointPlus() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        let result = p1 + p2
        let correctResult = CGPoint(x: 4 + 17.5, y: 5 + 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointPlusVector() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        let result = p1 + p2
        let correctResult = CGPoint(x: 4 + 17.5, y: 5 + 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointPlusEquals() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        var result = p1
        result += p2
        let correctResult = CGPoint(x: 4 + 17.5, y: 5 + 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointPlusVectorEquals() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        var result = p1
        result += p2
        let correctResult = CGPoint(x: 4 + 17.5, y: 5 + 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointTimes() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        let result = p1 * p2
        let correctResult = CGPoint(x: 4 * 17.5, y: 5 * 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointTimesVector() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        let result = p1 * p2
        let correctResult = CGPoint(x: 4 * 17.5, y: 5 * 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointTimesEquals() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        var result = p1
        result *= p2
        let correctResult = CGPoint(x: 4 * 17.5, y: 5 * 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }

    func testCGPointTimesEqualsVector() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        var result = p1
        result *= p2
        let correctResult = CGPoint(x: 4 * 17.5, y: 5 * 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }

    func testCGPointTimes2() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = -14.5
        let result = p1 * p2
        let correctResult = CGPoint(x: 4 * p2, y: 5 * p2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointTimesCGSize() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGSize(width: 13, height: 12)
        let result : CGPoint = p1 * p2
        let correctResult = CGPoint(x: 4 * 13, y: 5 * 12)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGSizeTimesCGPoint() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGSize(width: 13, height: 12)
        let result : CGPoint = p2 * p1
        let correctResult = CGPoint(x: 4 * 13, y: 5 * 12)

        checkPointsMatch(p1: result, p2: correctResult)
    }

    func testCGPointDivide() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = -14.5
        let result = p1 / p2
        let correctResult = CGPoint(x: 4 / p2, y: 5 / p2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointDivideOperator() {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: -14.5, y: 7.8)
        let result = p1 / p2
        let correctResult = CGPoint(x: 4 / p2.x, y: 5 / p2.y)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointLerp() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        let result = CGPoint.lerp(a: p1, b: p2, alpha: 0.5)
        let correctResult = CGPoint(x: 10.75, y: 29.1)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointDot() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        let result = CGPoint.dot(left: p1, right: p2)
        let correctResult = CGFloat(336)
        
        XCTAssertEqual(result, correctResult, accuracy: 0.005)
    }
    
    func testCGPointDistanceTo() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        let result = p1.distanceTo(other: p2)
        let correctResult = CGFloat(50.05487)
        
        XCTAssertEqual(result, correctResult, accuracy: 0.005)
    }
    
    func testCGPointLengthSQ() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let result = p1.lengthSQ()
        let correctResult = CGFloat(41)
        
        XCTAssertEqual(result, correctResult, accuracy: 0.005)
    }
    
    func testCGFloatLerp() throws {
        let p1 = CGFloat(4)
        let p2 = CGFloat(17.5)
        let result = CGFloat.lerp(a: p1, b: p2, alpha: 0.5)
        let correctResult = CGFloat(10.75)
        
        XCTAssertEqual(result, correctResult, accuracy: 0.005)
    }
    
    func testCGPointAngle() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        let result = p1.angle(to: p2)
        let correctResult = CGFloat(1.2977106710342325)
        
        XCTAssertEqual(result, correctResult, accuracy: 0.005)
    }
    
    func testCGPointMidpoint1() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 53.2)
        let result = p1.midpointBetween(other: p2)
        let correctResult = CGPoint(x: 10.75, y: 29.1)
        
        XCTAssertEqual(result.x, correctResult.x, accuracy: 0.005)
        XCTAssertEqual(result.y, correctResult.y, accuracy: 0.005)
    }
    
    func testCGPointBetween() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGPoint(x: 17.5, y: 5)
        let p3 = CGPoint(x: 4, y: 20)
        let p4 = CGPoint(x: 50.232, y: 5)
        
        let tp1 = CGPoint(x: 4, y: 17)
        let tp1p1 = CGPoint(x: 4, y: 16.9999)
        let tp2 = CGPoint(x: 40.5, y: 5)
        let tp2p1 = CGPoint(x: 40.4999, y: 5)

        XCTAssertTrue(tp1.between(p1, and: p3))
        XCTAssertTrue(tp2.between(p2, and: p4))

        XCTAssertTrue(tp1p1.between(tp1, and: p1))

        XCTAssertTrue(tp1.between(p3, and: p1))
        XCTAssertTrue(tp2.between(p4, and: p2))

        XCTAssertFalse(tp1.between(p2, and: p4))
        XCTAssertFalse(tp2.between(p1, and: p3))
        XCTAssertFalse(tp1.between(p2, and: p3))
        XCTAssertFalse(tp1.between(p1, and: p4))
        
        XCTAssertFalse(tp1.between(p1, and: tp1))
        XCTAssertFalse(tp1.between(tp1, and: p1))
        
        XCTAssertFalse(tp2.between(p2, and: tp2))
        XCTAssertFalse(tp2.between(tp2, and: p2))

        XCTAssertTrue(tp2p1.between(p2, and: tp2))
    }
    
    func testPointOnCircle() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let radius = CGFloat(40.0)
        let at0  = p1.pointOnCircle(withRadius: radius, atDegrees: 0.0)
        let at90  = p1.pointOnCircle(withRadius: radius, atDegrees: 90.0)
        let at180  = p1.pointOnCircle(withRadius: radius, atDegrees: 180.0)
        let at270  = p1.pointOnCircle(withRadius: radius, atDegrees: 270.0)
        let at33  = p1.pointOnCircle(withRadius: radius, atDegrees: 33.0)
        let at135 = p1.pointOnCircle(withRadius: radius, atDegrees: 135.0)
        let at234 = p1.pointOnCircle(withRadius: radius, atDegrees: 234.0)
        let at315 = p1.pointOnCircle(withRadius: radius, atDegrees: 315.0)

        checkPointsMatch(p1: at0, p2: CGPoint(x: 4.0, y: 5 + 40.0))
        checkPointsMatch(p1: at90, p2: CGPoint(x: 4.0 + 40.0, y: 5.0))
        checkPointsMatch(p1: at180, p2: CGPoint(x: 4.0, y: 5 - 40.0))
        checkPointsMatch(p1: at270, p2: CGPoint(x: 4.0 - 40.0, y: 5.0))

        checkPointsMatch(p1: at33, p2: CGPoint(x: 25.7855614006011, y: 38.546822717817))
        checkPointsMatch(p1: at135, p2: CGPoint(x: 32.284271247462, y: -23.2842712474618))
        checkPointsMatch(p1: at234, p2: CGPoint(x: -28.360679774998, y: -18.5114100916989))
        checkPointsMatch(p1: at315, p2: CGPoint(x: -24.2842712474618, y: 33.284271247462))
    }
    
    func testPointOnElipse() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let radius = CGFloat(40.0)
        let radiusFactor : CGPoint = .init(x: 1.0, y: 1.5)
        let radius2 = radius / radiusFactor.y
        let at0   = p1.pointOnElipse(withRadius: radius, withRadiiFactor: radiusFactor, atDegrees: 0.0, withRotation: 0.0)
        let at90  = p1.pointOnElipse(withRadius: radius, withRadiiFactor: radiusFactor, atDegrees: 90.0, withRotation: 0.0)
        let at180 = p1.pointOnElipse(withRadius: radius, withRadiiFactor: radiusFactor, atDegrees: 180.0, withRotation: 0.0)
        let at270 = p1.pointOnElipse(withRadius: radius, withRadiiFactor: radiusFactor, atDegrees: 270.0, withRotation: 0.0)

        checkPointsMatch(p1: at0, p2: CGPoint(x: 4.0, y: 5 + radius2))
        checkPointsMatch(p1: at90, p2: CGPoint(x: 4.0 + radius, y: 5.0))
        checkPointsMatch(p1: at180, p2: CGPoint(x: 4.0, y: 5 - radius2))
        checkPointsMatch(p1: at270, p2: CGPoint(x: 4.0 - radius, y: 5.0))
    }
    
    func testCartesian3DCoordinate() throws {
        let sphericalPolarCoordinate = CGPoint(x: CGFloat(GLKMathDegreesToRadians(144.9633200)),
                                               y: CGFloat(GLKMathDegreesToRadians(-37.8140000)))
        let radius = 40.0
        
        let result = sphericalPolarCoordinate.asCartesian3DCoordinate(withRadius: radius)
        
        XCTAssertEqual(result.x, 14.07924873, accuracy: 0.005)
        XCTAssertEqual(result.y, 32.75138722, accuracy: 0.005)
        XCTAssertEqual(result.z, -18.14170308, accuracy: 0.005)
    }
    
    func testSphericalPolarCoordinate() throws {
        let cartesianCoordinate = GLKVector3(v: (14.07924873, 32.75138722, -18.14170308))
        let radius = 40.0
        
        let result = CGPoint(withCartesian3DCoordinate: cartesianCoordinate, andSphereRadius: radius)
        
        XCTAssertEqual(GLKMathRadiansToDegrees(Float(result.x)), 144.9633200, accuracy: 0.005)
        XCTAssertEqual(GLKMathRadiansToDegrees(Float(result.y)), -37.8140000, accuracy: 0.005)
    }
    
    func testCoordinateConversion() throws {
        let cartesianCoordinate = GLKVector3(v: (14.07924873, 32.75138722, -18.14170308))
        let radius = 40.0
        
        let sphericalPolarCoordinate = CGPoint(withCartesian3DCoordinate: cartesianCoordinate, andSphereRadius: radius)
        let reverseConversion = sphericalPolarCoordinate.asCartesian3DCoordinate(withRadius: radius)
        
        XCTAssertEqual(reverseConversion.x, cartesianCoordinate.x, accuracy: 0.005)
        XCTAssertEqual(reverseConversion.y, cartesianCoordinate.y, accuracy: 0.005)
        XCTAssertEqual(reverseConversion.z, cartesianCoordinate.z, accuracy: 0.005)
    }
    
    func testReverseCoordinateConversion() throws {
        let sphericalPolarCoordinate = CGPoint(x: CGFloat(GLKMathDegreesToRadians(144.9633200)),
                                               y: CGFloat(GLKMathDegreesToRadians(-37.8140000)))
        let radius = 40.0
        
        let result = sphericalPolarCoordinate.asCartesian3DCoordinate(withRadius: radius)
        
        let reverseConversion = CGPoint(withCartesian3DCoordinate: result, andSphereRadius: radius)
        
        XCTAssertEqual(sphericalPolarCoordinate.x, reverseConversion.x, accuracy: 0.005)
        XCTAssertEqual(sphericalPolarCoordinate.y, reverseConversion.y, accuracy: 0.005)
    }
    
    // The following tests were taken from: https://github.com/sromku/polygon-contains-point/blob/master/src/test/java/Tests.java
    //
    func testSimplePolygon() throws {
        
        let polygon : [CGPoint] = [
            CGPoint(x: 1, y: 3),
            CGPoint(x: 2, y: 8),
            CGPoint(x: 5, y: 4),
            CGPoint(x: 5, y: 9),
            CGPoint(x: 7, y: 5),
            CGPoint(x: 6, y: 1),
            CGPoint(x: 3, y: 1)
        ]
        
        // Point is inside
        XCTAssertTrue(CGPoint(x: 5.6, y: 7).isInsidePolygon(vertices: polygon))
        
        // Point isn't inside
        XCTAssertFalse(CGPoint(x: 4.5, y: 7).isInsidePolygon(vertices: polygon))
    }
    
    /**
     * Create polygon two holes and check that the point is inside
     */
    func testPolygonWithHoles() throws {
        let polygon : [CGPoint] = [
            CGPoint(x: 1, y: 2), // polygon
            CGPoint(x: 1, y: 6),
            CGPoint(x: 8, y: 7),
            CGPoint(x: 8, y: 1)
        ]
        
        // Point is inside
        XCTAssertTrue(CGPoint(x: 6, y: 5).isInsidePolygon(vertices: polygon))
        
        // Point isn't inside
        XCTAssertTrue(CGPoint(x: 4, y: 3).isInsidePolygon(vertices: polygon))
        
        // Point isn't inside
        XCTAssertTrue(CGPoint(x: 6.5, y: 5.8).isInsidePolygon(vertices: polygon))
    }
    
    func testPolygonFigure6() throws {
        
        // example 1
        let polygon : [CGPoint] = [
            CGPoint(x: 1, y: 3),
            CGPoint(x: 9, y: 3),
            CGPoint(x: 9, y: 7),
            CGPoint(x: 7, y: 5),
            CGPoint(x: 5, y: 7),
            CGPoint(x: 3, y: 5),
            CGPoint(x: 1, y: 7),
            CGPoint(x: 1, y: 3)
        ]
        
        // Point is inside
        XCTAssertTrue(CGPoint(x: 5, y: 5).isInsidePolygon(vertices: polygon))
        
        // example 2
        let polygon2 : [CGPoint] = [
            CGPoint(x: 1, y: 3),
            CGPoint(x: 3, y: 5),
            CGPoint(x: 5, y: 3),
            CGPoint(x: 7, y: 5),
            CGPoint(x: 9, y: 3),
            CGPoint(x: 9, y: 7),
            CGPoint(x: 1, y: 7)
        ]
        
        // Point is inside
        XCTAssertTrue(CGPoint(x: 5, y: 5).isInsidePolygon(vertices: polygon2))
    }
    
    func testIsInsideRect() throws {
        let rect = CGRect(origin: .init(x: 14.5, y: 50.2), size: .init(width: 45.0, height: 45.0))
        
        XCTAssertTrue(CGPoint(x: 14.50, y: 52.0).isInside(rect: rect))
        XCTAssertTrue(CGPoint(x: 59.49, y: 52.0).isInside(rect: rect))
        XCTAssertTrue(CGPoint(x: 14.50, y: 50.20).isInside(rect: rect))
        XCTAssertTrue(CGPoint(x: 59.49, y: 95.19).isInside(rect: rect))

        XCTAssertFalse(CGPoint(x: 14.49, y: 52.0).isInside(rect: rect))
        XCTAssertFalse(CGPoint(x: 59.50, y: 52.0).isInside(rect: rect))
        XCTAssertFalse(CGPoint(x: 14.5, y: 50.19).isInside(rect: rect))
        XCTAssertFalse(CGPoint(x: 59.49, y: 95.20).isInside(rect: rect))
    }
    
    /**
     * Test issue: https://github.com/sromku/polygon-contains-point/issues/1
     */
    func testMapCoordinates1() throws {
        
        let polygon : [CGPoint] = [
            CGPoint(x: 42.499148, y: 27.485196),
            CGPoint(x: 42.498600, y: 27.480000),
            CGPoint(x: 42.503800, y: 27.474680),
            CGPoint(x: 42.510000, y: 27.468270),
            CGPoint(x: 42.510788, y: 27.466904),
            CGPoint(x: 42.512116, y: 27.465350),
            CGPoint(x: 42.512000, y: 27.467000),
            CGPoint(x: 42.513579, y: 27.471027),
            CGPoint(x: 42.512938, y: 27.472668),
            CGPoint(x: 42.511829, y: 27.474922),
            CGPoint(x: 42.507945, y: 27.480124),
            CGPoint(x: 42.509082, y: 27.482892),
            CGPoint(x: 42.536026, y: 27.490519),
            CGPoint(x: 42.534470, y: 27.499703),
            CGPoint(x: 42.499148, y: 27.485196)
        ]
        
        XCTAssertTrue(CGPoint(x: 42.508956, y: 27.483328).isInsidePolygon(vertices: polygon))
        XCTAssertTrue(CGPoint(x: 42.505, y: 27.48).isInsidePolygon(vertices: polygon))
        
    }
    
    /**
     * Test issue: https://github.com/sromku/polygon-contains-point/issues/1
     */
    func testMapCoordinates2() throws {
        
        let polygon : [CGPoint] = [
            CGPoint(x: 40.481171, y: 6.4107070), // NE
            CGPoint(x: 40.480248, y: 6.4101200), // SE. This point doesn't fail the test anymore
            CGPoint(x: 40.480237, y: 6.4062790), // SW
            CGPoint(x: 40.481161, y: 6.4062610) // NW
        ]
        
        XCTAssertTrue(CGPoint(x: 40.480890, y: 6.4081030).isInsidePolygon(vertices: polygon))
        
    }
    
    /**
     * Test issue: https://github.com/sromku/polygon-contains-point/issues/3
     */
    func testParallel() throws {
        
        let polygon : [CGPoint] = [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 0, y: 1),
            CGPoint(x: 1, y: 2),
            CGPoint(x: 1, y: 99),
            CGPoint(x: 100, y: 0)
        ]
        
        XCTAssertTrue(CGPoint(x: 3, y: 4).isInsidePolygon(vertices: polygon))
        XCTAssertTrue(CGPoint(x: 3, y: 4.1).isInsidePolygon(vertices: polygon))
        XCTAssertTrue(CGPoint(x: 3, y: 3.9).isInsidePolygon(vertices: polygon))
        XCTAssertFalse(CGPoint(x: 102, y: 3.9).isInsidePolygon(vertices: polygon))

    }
    
    func testBorders() throws {
        
        /*
         * Unfortunately, this method won't work if the point is on the edge of the polygon.
         * https://en.wikipedia.org/wiki/Point_in_polygon#Ray_casting_algorithm
         */
        
        let polygon : [CGPoint] = [
            CGPoint(x: -1, y: -1),
            CGPoint(x: -1, y: 1),
            CGPoint(x: 1, y: 1),
            CGPoint(x: 1, y: -1)
        ]
        
        // it's false !
        XCTAssertFalse(CGPoint(x: 0, y: 1).isInsidePolygon(vertices: polygon))
        
        // it's true !
        XCTAssertTrue(CGPoint(x: -1, y: 0).isInsidePolygon(vertices: polygon))
    }
    
}
