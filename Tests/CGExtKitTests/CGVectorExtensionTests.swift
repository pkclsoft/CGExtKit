//
//  CGVectorExtensionTests.swift
//  
//
//  Created by Peter Easdown on 31/1/2023.
//

import XCTest
import GLKit
import CoreGraphics
import CGExtKit

final class CGVectorExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCGVectorExtensionInitPoint() throws {
        let v = CGVector(point: CGPoint(x: 4, y: 5))
        
        XCTAssertEqual(v.dx, 4)
        XCTAssertEqual(v.dy, 5)
    }

    func testCGVectorExtensionInitAngle() throws {
        let radians = CGFloat(GLKMathDegreesToRadians(33))
        let v = CGVector(angle: radians)
        
        XCTAssertEqual(v.dx, 0.838671, accuracy:0.005)
        XCTAssertEqual(v.dy, 0.544639, accuracy:0.005)
    }

    func testCGVectorExtensionOffset() throws {
        var v = CGVector(point: CGPoint(x: 4, y: 5))
        v = v.offset(dx: 7, dy:9)
        
        XCTAssertEqual(v.dx, 11)
        XCTAssertEqual(v.dy, 14)
    }
    
    func testCGVectorLength() throws {
        let v = CGVector(point: CGPoint(x: 4, y: 5))
        let length = v.length()
        let correctResult = 6.4031242374328485
        
        XCTAssertEqual(length, correctResult, accuracy: 0.005)
    }
    
    func testCGVectorLengthSquared() throws {
        let v = CGVector(point: CGPoint(x: 4, y: 5))
        let lengthSquared = v.lengthSquared()
        let correctResult = 6.4031242374328485

        XCTAssertEqual(lengthSquared, (correctResult * correctResult), accuracy: 0.005)
    }
    
    func testCGVectorNormalized() throws {
        let v = CGVector(point: CGPoint(x: 4, y: 5))
        let result = v.normalized()
        let correctResult = CGVector(dx: 0.6246950475544243, dy: 0.7808688094430304)

        XCTAssertEqual(result.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(result.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorNormalize() throws {
        var v = CGVector(point: CGPoint(x: 4, y: 5))
        _ = v.normalize()
        let correctResult = CGVector(dx: 0.6246950475544243, dy: 0.7808688094430304)

        XCTAssertEqual(v.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(v.dy, correctResult.dy, accuracy: 0.005)
    }
    
    func testCGVectorDistanceTo() throws {
        let v1 = CGVector(point: CGPoint(x: 4, y: 5))
        let v2 = CGVector(point: CGPoint(x: 17.5, y: 53.2))
        let correctResult = 50.05487
        let result = v2.distanceTo(v1)
        
        XCTAssertEqual(result, correctResult, accuracy: 0.005)
    }
    
    func testCGVectorAngle() throws {
        let radians = CGFloat(GLKMathDegreesToRadians(33))
        let v = CGVector(dx: 0.838671, dy: 0.544639)
        let result = v.angle
        
        XCTAssertEqual(result, radians, accuracy:0.005)
    }

    func testCGVectorPlus() throws {
        let p1 = CGVector(dx: 4, dy: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        let result = p1 + p2
        let correctResult = CGVector(dx: 4 + 17.5, dy: 5 + 53.2)
        
        XCTAssertEqual(result.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(result.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorPlusEquals() throws {
        var p1 = CGVector(dx: 4, dy: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        p1 += p2
        let correctResult = CGVector(dx: 4 + 17.5, dy: 5 + 53.2)
        
        XCTAssertEqual(p1.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(p1.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorMinus() throws {
        let p1 = CGVector(dx: 4, dy: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        let result = p1 - p2
        let correctResult = CGVector(dx: 4 - 17.5, dy: 5 - 53.2)
        
        XCTAssertEqual(result.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(result.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorMinusEquals() throws {
        var p1 = CGVector(dx: 4, dy: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        p1 -= p2
        let correctResult = CGVector(dx: 4 - 17.5, dy: 5 - 53.2)
        
        XCTAssertEqual(p1.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(p1.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorTimes() throws {
        let p1 = CGVector(dx: 4, dy: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        let result = p1 * p2
        let correctResult = CGVector(dx: 4 * 17.5, dy: 5 * 53.2)
        
        XCTAssertEqual(result.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(result.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorTimesEquals() throws {
        var p1 = CGVector(dx: 4, dy: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        p1 *= p2
        let correctResult = CGVector(dx: 4 * 17.5, dy: 5 * 53.2)
        
        XCTAssertEqual(p1.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(p1.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorTimes2() throws {
        let p1 = CGVector(dx: 4, dy: 5)
        let p2 = -14.5
        let result = p1 * p2
        let correctResult = CGVector(dx: 4 * p2, dy: 5 * p2)
        
        XCTAssertEqual(result.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(result.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorTimes2Equals() throws {
        var p1 = CGVector(dx: 4, dy: 5)
        let p2 = -14.5
        p1 *= p2
        let correctResult = CGVector(dx: 4 * p2, dy: 5 * p2)
        
        XCTAssertEqual(p1.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(p1.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorDivide() throws {
        let p1 = CGVector(dx: 4, dy: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        let result = p1 / p2
        let correctResult = CGVector(dx: 4 / 17.5, dy: 5 / 53.2)
        
        XCTAssertEqual(result.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(result.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorDivideEquals() throws {
        var p1 = CGVector(dx: 4, dy: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        p1 /= p2
        let correctResult = CGVector(dx: 4 / 17.5, dy: 5 / 53.2)
        
        XCTAssertEqual(p1.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(p1.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorDivide2() throws {
        let p1 = CGVector(dx: 4, dy: 5)
        let p2 = -14.5
        let result = p1 / p2
        let correctResult = CGVector(dx: 4 / p2, dy: 5 / p2)
        
        XCTAssertEqual(result.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(result.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorDivide2Equals() throws {
        var p1 = CGVector(dx: 4, dy: 5)
        let p2 = -14.5
        p1 /= p2
        let correctResult = CGVector(dx: 4 / p2, dy: 5 / p2)
        
        XCTAssertEqual(p1.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(p1.dy, correctResult.dy, accuracy: 0.005)
    }

    func testCGVectorLerp() throws {
        let p1 = CGVector(dx: 4, dy: 5)
        let p2 = CGVector(dx: 17.5, dy: 53.2)
        let result = CGVector.lerp(start: p1, end: p2, alpha: 0.5)
        let correctResult = CGVector(dx: 10.75, dy: 29.1)
        
        XCTAssertEqual(result.dx, correctResult.dx, accuracy: 0.005)
        XCTAssertEqual(result.dy, correctResult.dy, accuracy: 0.005)
    }

}
