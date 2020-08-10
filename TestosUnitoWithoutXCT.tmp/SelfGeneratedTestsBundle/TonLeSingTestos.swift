//
//  TonLeSingTestos.swift
//  SelfGeneratedTestsBundle
//
//  Created by Jerry Ren on 8/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest

@testable import TestosUnitoWithoutXCT

class TonLeSingTestos: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testingSingleTonObject() {
        
        let objec1 = TonLeSing.shared
        let objec2 = TonLeSing.shared
       
        //  let objec3 = TonLeSing()
        // initializer is inaccessible due to 'private' protection level
        
        XCTAssertTrue(objec1 === objec2)
    }
}
