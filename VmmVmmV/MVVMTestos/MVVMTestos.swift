//
//  MVVMTestos.swift
//  MVVMTestos
//
//  Created by Jerry Ren on 8/7/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest
@testable import VMMVMMV

class MVVMTestos: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testingViewModelNotNil() {
        XCTAssertNotNil(ViewMModel.init())
    }
    
    func testingGetRows() {
         
        let viewMod = ViewMModel.init()
        XCTAssertEqual(viewMod.getRows(), 0)
    }
    
    func testingGetObject() {
        let viewMod = ViewMModel()
        
  //      let objc = viewMod.getObject(index: 0)
  //      XCTAssertNil(objc)
    }

}
  
