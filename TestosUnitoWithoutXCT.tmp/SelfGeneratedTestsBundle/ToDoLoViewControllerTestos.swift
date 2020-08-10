//
//  ToDoLoViewControllerTestos.swift
//  SelfGeneratedTestsBundle
//
//  Created by Jerry Ren on 8/4/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest

@testable import TestosUnitoWithoutXCT

class ToDoLoViewControllerTestos: XCTestCase {
    
    var sut: ToDoLoViewController!

    override func setUpWithError() throws {
        let sBoar = UIStoryboard(name: "Main", bundle: nil)
        sut = sBoar.instantiateViewController(withIdentifier: "tdlvc") as! ToDoLoViewController
        _ = sut?.view
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
 
    func testingDataSourceDelegate() {
        XCTAssertNotNil(sut.toDoTable.delegate)
 //       XCTAssertNil(sut.toDoTable.dataSource)
    }
   
}


//    func testNumbOfRows() {
//
//        let testObjc = [ToDoModel(userID: 1, id: 1, title: "heck", completed: false), ToDoModel(userID: 2, id: 2, title: "kceh", completed: false)]
//        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
//        let rows = sut.toDoTable
//        sut.items = testObjc
//
//        XCTAssertEqual(rows, 2)
//    }
