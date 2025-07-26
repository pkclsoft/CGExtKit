//
//  CGFloatExtenstionTests.swift
//  CGExtKit
//
//  Created by Peter Easdown on 26/7/2025.
//

import XCTest
import GLKit
import CoreGraphics
import CGExtKit

final class CGFloatExtensionTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRadians() {
        let deg : CGFloat = 180.0
        let correctResult = CGFloat.pi
        
        XCTAssertEqual(deg.radians(), correctResult, accuracy: 0.005)

        let deg2 : CGFloat = 90.0
        let correctResult2 = CGFloat.pi / 2.0
        
        XCTAssertEqual(deg2.radians(), correctResult2, accuracy: 0.005)

        let deg3 : CGFloat = 270.0
        let correctResult3 = CGFloat.pi * 1.5
        
        XCTAssertEqual(deg3.radians(), correctResult3, accuracy: 0.005)

        let deg4 : CGFloat = 360.0
        let correctResult4 = CGFloat.pi * 2.0
        
        XCTAssertEqual(deg4.radians(), correctResult4, accuracy: 0.005)
    }
    
    func testDegrees() {
        let deg : CGFloat = CGFloat.pi
        let correctResult = 180.0
        
        XCTAssertEqual(deg.degrees(), correctResult, accuracy: 0.005)

        let deg2 : CGFloat = CGFloat.pi / 2.0
        let correctResult2 = 90.0
        
        XCTAssertEqual(deg2.degrees(), correctResult2, accuracy: 0.005)

        let deg3 : CGFloat = CGFloat.pi * 1.5
        let correctResult3 = 270.0
        
        XCTAssertEqual(deg3.degrees(), correctResult3, accuracy: 0.005)

        let deg4 : CGFloat = CGFloat.pi * 2.0
        let correctResult4 = 360.0
        
        XCTAssertEqual(deg4.degrees(), correctResult4, accuracy: 0.005)
    }
}
