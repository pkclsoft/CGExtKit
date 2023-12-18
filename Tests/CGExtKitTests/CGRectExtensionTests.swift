//
//  CGRectExtensionTests.swift
//  
//
//  Created by Peter Easdown on 16/7/2023.
//

import XCTest
import GLKit
import CoreGraphics
import CGExtKit

final class CGRectExtensionTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
 
    func testCentreOf() throws {
        let x = 25.0
        let y = 453.2
        let width = 350.0
        let height = 240.0
        let subject = CGRect(x: x, y: y, width: width, height: height)
        let centre = subject.centerOf()
        
        XCTAssertEqual(centre.x, 25.0 + 175.0, accuracy: 0.1)
        XCTAssertEqual(centre.y, 453.2 + 120.0, accuracy: 0.1)
    }
    
    func testDivideByFloat() throws {
        let x = 25.0
        let y = 453.2
        let width = 350.0
        let height = 240.0
        let subject = CGRect(x: x, y: y, width: width, height: height)
        let divisor = 2.0
        let result = subject / divisor
        
        XCTAssertEqual(result.origin.x, x + width / divisor / 2.0, accuracy: 0.1)
        XCTAssertEqual(result.origin.y, y + height / divisor / 2.0, accuracy: 0.1)
        XCTAssertEqual(result.size.width, width / divisor, accuracy: 0.1)
        XCTAssertEqual(result.size.height, height / divisor, accuracy: 0.1)
        XCTAssertEqual(subject.centerOf(), result.centerOf())

        let divisor2 = 3.0
        let result2 = subject / divisor2
        
        XCTAssertEqual(result2.origin.x, x + width * (2.0 / divisor2) / 2.0, accuracy: 0.1)
        XCTAssertEqual(result2.origin.y, y + height * (2.0 / divisor2) / 2.0, accuracy: 0.1)
        XCTAssertEqual(result2.size.width, width / divisor2, accuracy: 0.1)
        XCTAssertEqual(result2.size.height, height / divisor2, accuracy: 0.1)
        XCTAssertEqual(subject.centerOf(), result2.centerOf())

        let divisor3 = 0.5
        let result3 = subject / divisor3
        let newW = width / divisor3
        let newH = height / divisor3
        let newX = x + (width / 2.0) - (newW / 2.0)
        let newY = y + (height / 2.0) - (newH / 2.0)

        XCTAssertEqual(result3.origin.x, newX, accuracy: 0.1)
        XCTAssertEqual(result3.origin.y, newY, accuracy: 0.1)
        XCTAssertEqual(result3.size.width, newW, accuracy: 0.1)
        XCTAssertEqual(result3.size.height, newH, accuracy: 0.1)
        XCTAssertEqual(subject.centerOf(), result3.centerOf())
    }
    
    func testMultiplyByFloat() throws {
        let x = 25.0
        let y = 453.2
        let width = 350.0
        let height = 240.0
        let subject = CGRect(x: x, y: y, width: width, height: height)
        let factor = 2.0
        let result = subject * factor

        XCTAssertEqual(result.origin.x, x - width / factor, accuracy: 0.1)
        XCTAssertEqual(result.origin.y, y - height / factor, accuracy: 0.1)
        XCTAssertEqual(result.size.width, width * factor, accuracy: 0.1)
        XCTAssertEqual(result.size.height, height * factor, accuracy: 0.1)
        XCTAssertEqual(subject.centerOf(), result.centerOf())

        let factor2 = 0.5
        let result2 = subject * factor2
        let newW = width * factor2
        let newH = height * factor2
        let newX = x + (width / 2.0) - (newW / 2.0)
        let newY = y + (height / 2.0) - (newH / 2.0)

        XCTAssertEqual(result2.origin.x, newX, accuracy: 0.1)
        XCTAssertEqual(result2.origin.y, newY, accuracy: 0.1)
        XCTAssertEqual(result2.size.width, newW, accuracy: 0.1)
        XCTAssertEqual(result2.size.height, newH, accuracy: 0.1)
        XCTAssertEqual(subject.centerOf(), result2.centerOf())
    }
}
