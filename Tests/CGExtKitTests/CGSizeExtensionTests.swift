//
//  CGSizeExtensionTests.swift
//  
//
//  Created by Peter Easdown on 31/1/2023.
//

import XCTest
import GLKit
import CoreGraphics
import CGExtKit

final class CGSizeExtensionTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func checkPointsMatch(p1: CGSize, p2: CGSize) {
        XCTAssertEqual(p1.width, p2.width, accuracy: 0.005)
        XCTAssertEqual(p1.height, p2.height, accuracy: 0.005)
    }
    
    func testCGSizeMinus() throws {
        let p1 = CGSize(width: 4, height: 5)
        let p2 = CGSize(width: 17.5, height: 53.2)
        let result = p1 - p2
        let correctResult = CGSize(width: 4 - 17.5, height: 5 - 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGSizePlus() throws {
        let p1 = CGSize(width: 4, height: 5)
        let p2 = CGSize(width: 17.5, height: 53.2)
        let result = p1 + p2
        let correctResult = CGSize(width: 4 + 17.5, height: 5 + 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGSizeTimes() throws {
        let p1 = CGSize(width: 4, height: 5)
        let p2 = CGSize(width: 17.5, height: 53.2)
        let result = p1 * p2
        let correctResult = CGSize(width: 4 * 17.5, height: 5 * 53.2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGSizeTimes2() throws {
        let p1 = CGSize(width: 4, height: 5)
        let p2 = -14.5
        let result = p1 * p2
        let correctResult = CGSize(width: 4 * p2, height: 5 * p2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGPointTimesCGSize() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGSize(width: 13, height: 12)
        let result : CGSize = p1 * p2
        let correctResult = CGSize(width: 4 * 13, height: 5 * 12)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGSizeTimesCGPoint() throws {
        let p1 = CGPoint(x: 4, y: 5)
        let p2 = CGSize(width: 13, height: 12)
        let result : CGSize = p2 * p1
        let correctResult = CGSize(width: 4 * 13, height: 5 * 12)

        checkPointsMatch(p1: result, p2: correctResult)
    }

    func testCGSizeDivide() throws {
        let p1 = CGSize(width: 4, height: 5)
        let p2 = -14.5
        let result = p1 / p2
        let correctResult = CGSize(width: 4 / p2, height: 5 / p2)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGSizeLerp() throws {
        let p1 = CGSize(width: 4, height: 5)
        let p2 = CGSize(width: 17.5, height: 53.2)
        let result = CGSize.lerp(a: p1, b: p2, alpha: 0.5)
        let correctResult = CGSize(width: 10.75, height: 29.1)
        
        checkPointsMatch(p1: result, p2: correctResult)
    }
    
    func testCGSizeDot() throws {
        let p1 = CGSize(width: 4, height: 5)
        let p2 = CGSize(width: 17.5, height: 53.2)
        let result = CGSize.dot(left: p1, right: p2)
        let correctResult = CGFloat(336)
        
        XCTAssertEqual(result, correctResult, accuracy: 0.005)
    }
    
    func testCGSizeLengthSQ() throws {
        let p1 = CGSize(width: 4, height: 5)
        let result = p1.lengthSQ()
        let correctResult = CGFloat(41)
        
        XCTAssertEqual(result, correctResult, accuracy: 0.005)
    }
    
}
