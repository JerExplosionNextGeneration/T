//
//  QuickNimbleTableTestos.swift
//  SelfGeneratedTestsBundle
//
//  Created by Jerry Ren on 8/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest
import Nimble
import Quick

@testable import TestosUnitoWithoutXCT 

class QuickNimbleTableTestos: QuickSpec {
               
    override func spec() {
        
        let mockVC = MockToDoLoVC()
        var sut: ToDoLoDataSourceDelegate!
        
        beforeEach {
            sut = ToDoLoDataSourceDelegate()
        }
        afterEach {
            sut = nil
        }
        
        describe("Table Operations") {
            context("data source methods") {
                
                it("test number of rows") {
                    let testObjcs = [ToDoModel(userID: 1, id: 1, title: "heco", completed: false), ToDoModel(userID: 2, id: 2, title: "kceh", completed: false)]
                    
                    sut.items = testObjcs
                    let testTable = UITableView()
                    let rows = sut.tableView(testTable, numberOfRowsInSection: 0)
                    expect(rows).to(equal(2))
                }
                
                it("test cell for row") {
                    let testObjc = [ToDoModel(userID: 1, id: 1, title: "heco", completed: false), ToDoModel(userID: 2, id: 2, title: "kceh", completed: false)]
                    
                    let testIndex = IndexPath(row: 0, section: 0)
                    
                    sut.items = testObjc
                    sut.delegate = mockVC
                    
                    let tableForTest = UITableView()
                    tableForTest.dataSource = sut
                    
                    tableForTest.register(UITableViewCell .self, forCellReuseIdentifier: "id")
                    let cellForTest = sut.tableView(tableForTest, cellForRowAt: testIndex)
                    
                    let cellText = cellForTest.textLabel?.text
                    
                    expect(cellText).to(equal("1"))
                }
            }

            context("delegate methods") {
                it("test did select row") {
                     
                    let testObjc = [ToDoModel(userID: 1, id: 1, title: "heco", completed: false), ToDoModel(userID: 2, id: 2, title: "kceh", completed: true)]
                    
                    let indexForTest = IndexPath(row: 0, section: 0)
                    
                    sut.delegate = mockVC
                    sut.tableView(UITableView(), didSelectRowAt: indexForTest)
                    
                    expect(mockVC.isDidSelectCalled).to(equal(true))
                    expect(mockVC.selectedRow).to(equal(0))
                }
            }
        }
        
    }
}
