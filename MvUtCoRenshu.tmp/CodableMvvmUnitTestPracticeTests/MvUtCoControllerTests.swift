//
//  MvUtCoControllerTests.swift
//  CodableMvvmUnitTestPracticeTests
//
//  Created by Jerry Ren on 8/18/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest

@testable import CodableMvvmUnitTestPractice

class MvUtCoControllerTests: XCTestCase {
    
    var sutVC: MvUtCoViewController!

    override func setUpWithError() throws {
        let sBoard = UIStoryboard(name: "Main", bundle: nil)
        sutVC = sBoard.instantiateViewController(withIdentifier: GloballyApplied.mvutcoSBoardID) as! MvUtCoViewController
        _ = sutVC.view
   //     sutVC.viewDidLoad()
    }

    override func tearDownWithError() throws {
        sutVC = nil
    }
    
    func testingDataSourceDelegate() {
        XCTAssertNotNil(sutVC.displayTable.dataSource)
        XCTAssertNotNil(sutVC.displayTable.delegate)
    }

}
  
