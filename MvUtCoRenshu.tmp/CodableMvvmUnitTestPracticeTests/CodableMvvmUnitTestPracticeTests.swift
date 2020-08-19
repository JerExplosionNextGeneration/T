//
//  CodableMvvmUnitTestPracticeTests.swift
//  CodableMvvmUnitTestPracticeTests
//
//  Created by Jerry Ren on 8/18/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest
@testable import CodableMvvmUnitTestPractice

class CodableMvvmUnitTestPracticeTests: XCTestCase {
    
    var sutViewModel: MvUtCoViewModel?
    var simulatedTableView: UITableView?
    var simulatedVC = MvUtCoViewController()
    
    let productResultOne = ProductResult(trackName: "UnderArmour", sellerUrl: "nike.com", description: "Adidas > nike & underarmor")
    let productResultTwo = ProductResult(trackName: "UnderArmour", sellerUrl: "nike.com", description: "Adidas > nike & underarmor")
    
    
    override func setUpWithError() throws {
        sutViewModel = MvUtCoViewModel.init()
    }
    
    override func tearDownWithError() throws {
        sutViewModel = nil
    }
    
    func testingViewModelNotNil() {
        XCTAssertNotNil(sutViewModel)
    }
    
    func testingCellForR() {
        simulatedTableView = UITableView()
        let indexForTest = IndexPath(row: 0, section: 0)
        
        let iProductModelData = IProductModel(results: [productResultOne])
        sutViewModel?.iProduct = iProductModelData
        
        simulatedTableView?.dataSource = simulatedVC
        simulatedTableView?.delegate = simulatedVC
        
        //        simulatedTableView?.register(UITableViewCell.self, forCellReuseIdentifier: GloballyApplied.idOfCell)
        //        let cellForTest = simulatedTableView?.cellForRow(at: indexForTest) as! IProductTviCell
        //
        //        let cellTracknameText = cellForTest.trackNameLabel.text
        //        XCTAssertEqual(cellTracknameText, "UnderArmour")
    }
    
    func testingVmDataGetter() {
        let iProductModelData = IProductModel(results: [productResultTwo, productResultOne])
        let encodedData = try? JSONEncoder().encode(iProductModelData)
       // .....
    }
    
    func testingNumbOfR() {
        
        let iProductModelData = IProductModel(results: [productResultTwo, productResultOne])
        sutViewModel?.iProduct = iProductModelData
        
        let expectedVal = iProductModelData.results.count
        let actualVal = simulatedVC.tableView(UITableView(), numberOfRowsInSection: 0)
        
        // XCTAssertEqual(actualVal, expectedVal)
    }
}

//    var simulatedData: Data? {
//        return encodedData
// }








