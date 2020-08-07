//
//  ToDoLoDataDeleTestos.swift
//  SelfGeneratedTestsBundle
//
//  Created by Jerry Ren on 8/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest

@testable import TestosUnitoWithoutXCT

class MockToDoLoVC: UIViewController ,ToDoListDelegate {
    
    var selectedRow: Int = 0
    var isDidSelectCalled = false
    var isCellForRowCalled = false
    
    func didSelectRow(index: Int) {
        isDidSelectCalled = !isDidSelectCalled
        selectedRow = index
    }
}

class ToDoLoDataDeleTestos: XCTestCase {

    var sut: ToDoLoDataSourceDelegate!
    
    let mockVC = MockToDoLoVC()
    
    override func setUpWithError() throws {
        sut = ToDoLoDataSourceDelegate()
          
        mockVC.beginAppearanceTransition(true, animated: true)
        // beginapperancetransition
    }

    override func tearDownWithError() throws {
        sut = nil
        
        mockVC.endAppearanceTransition()
    }
    
    func testingNumbOfSects() {
        let sections = sut.numberOfSections(in: UITableView())
        
        XCTAssertEqual(1, sections)
    }
    
    func testingNumbOfRowsInSection() {
        let testObjcs = [ToDoModel(userID: 1, id: 1, title: "heco", completed: false), ToDoModel(userID: 2, id: 2, title: "kceh", completed: false)]
        sut.items = testObjcs
        
        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0) // 0 here represents section number, not number of rows, beware
        XCTAssertEqual(rows, 2)
    }
     
    func testingDidSelectRow() {
        let testObjc = [ToDoModel(userID: 1, id: 1, title: "heco", completed: false), ToDoModel(userID: 2, id: 2, title: "kceh", completed: false)]
        
        let testIndex = IndexPath(row: 0, section: 0)
        
        let mockVC = MockToDoLoVC()
        
        sut.delegate = mockVC
        sut.tableView(UITableView(), didSelectRowAt: testIndex)
        
        XCTAssertEqual(mockVC.selectedRow, 0)
        XCTAssertTrue(mockVC.isDidSelectCalled)   
        
    }
    
    func testingCellForRow() {
        
        let testObjc = [ToDoModel(userID: 1, id: 1, title: "kceh", completed: false), ToDoModel(userID: 2, id: 2, title: "heco", completed: false)]
        
        let indexForTest = IndexPath(row: 0, section: 0)

        sut.delegate = mockVC
        sut.items = testObjc
        
        let tableViewForTest = UITableView()
        tableViewForTest.dataSource = sut

        tableViewForTest.register(UITableViewCell.self, forCellReuseIdentifier: "id")

        let testCell = sut.tableView(tableViewForTest, cellForRowAt: indexForTest)
  
        let cellText = testCell.textLabel?.text
        
        XCTAssertEqual(cellText, "1")
    }
}

