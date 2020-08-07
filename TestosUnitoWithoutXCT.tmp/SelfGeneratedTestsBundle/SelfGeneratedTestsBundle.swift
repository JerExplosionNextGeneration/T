//
//  SelfGeneratedTestsBundle.swift
//  SelfGeneratedTestsBundle
//
//  Created by Jerry Ren on 8/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import XCTest

@testable import TestosUnitoWithoutXCT

class MockSession:SessionProtocol {
    
    var isFetchingDataCalled = false
    
    func fetchingData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.isFetchingDataCalled = true
        let dummyData1 = "dummy response".data(using: .utf8)
        
        let todo = ToDoModel(userID: 1, id: 1, title: "Heck", completed: false)
        
        let dummyData2 = try? JSONSerialization.jsonObject(with: JSONEncoder().encode(todo)) as? Data
        
       let dummyData3 = try? JSONEncoder().encode([todo])

        completion(dummyData3, nil, nil)
 //       completion(dummyData2, nil, nil)
//        completion(dummyData1, nil, nil)
        
    }
}



class APIHandlerTestos: XCTestCase {
  
    override func setUpWithError() throws {
    }
    override func tearDownWithError() throws {
    }
    // emptiness  
       
//    func testingFetchingRegularWay() {
//        let expectation = XCTestExpectation(description: "Testing APIHandler's fetching function")
//
//        let apiHandlerTestable = APIHandlerTestability()
//
//        apiHandlerTestable.fetchingToDoItems { (toDos) in
//            XCTAssertNotNil(toDos)
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 3)
//    }
    
    func testingFetchingWithoutExpectationProtocolWay() { // no need to create xctExpectation
//        let expectation = XCTestExpectation(description: "Testing APIHandler's fetching function")
        
        let mockSessionObject = MockSession()
        
        let apiHandlerTestable = APIHandlerTestable(session: mockSessionObject)

        apiHandlerTestable.fetchingToDoItems { (toDos) in
            XCTAssertNotNil(toDos)
 //           expectation.fulfill()
        }
        XCTAssertTrue(mockSessionObject.isFetchingDataCalled)
        
  //      wait(for: [expectation], timeout: 7)
    }
}
// since we are mocking, we don't need the xctExpectation - since there is no network calls, an d no need to timeout/wait either
      
     
