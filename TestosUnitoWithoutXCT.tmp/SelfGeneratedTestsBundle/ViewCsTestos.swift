//
//  ViewCsTestos.swift
//  SelfGeneratedTestsBundle
//
//  Created by Jerry Ren on 8/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest

@testable import TestosUnitoWithoutXCT

//class ViewCsTestos: XCTestCase {
//    
//    var sut: ViewController!
//    
//    override func setUpWithError() throws {
//        
//        let sBoar = UIStoryboard(name: "Main", bundle: nil)
//        sut = sBoar.instantiateInitialViewController()
//        //     _ = sut.view // important, otherwise all the elements in the view would be nil
//        sut.loadView()
//    }
//    
//    override func tearDownWithError() throws {
//        sut = nil
//    }
//    
//    func testingUpdateRabel() {
//        sut.updateResulRabel(value: 101)
//        XCTAssertEqual(sut.displayLabel.text, "101")
//    }
//    
//    func testingDiv() {
//        
//        sut.numbOneTextField.text = "121"
//        sut.numbTwoTextField.text = "11"
//        sut.div(UIButton())
//        XCTAssertEqual(sut.displayLabel.text, "11")
//    }
//    
//    func testingSubt() {
//        sut.numbOneTextField.text = "177"
//        sut.numbTwoTextField.text = "77"
//        sut.sub(UIButton())
//        XCTAssertEqual(sut.displayLabel.text, "100")
//    }
//    
//    func testingMult() {
//        sut.numbOneTextField.text = "101"
//        sut.numbTwoTextField.text = "13"
//        sut.mult(UIButton())
//        XCTAssertEqual("1313", sut.displayLabel.text)
//    }
//    
//    func testingAddi() {
//        sut.numbOneTextField.text = "133"
//        sut.numbTwoTextField.text = "55"
//        sut.add(UIButton())
//        XCTAssertEqual("188", sut.displayLabel.text)
//    }
//    
//    
//    
//    func testingRetrieval() {
//        
//        sut.numbOneTextField.text = "666"
//        sut.numbTwoTextField.text = "333"
//        XCTAssertEqual(sut.retrieveNumbInt(), [666, 333])
//    }
//    
//}
