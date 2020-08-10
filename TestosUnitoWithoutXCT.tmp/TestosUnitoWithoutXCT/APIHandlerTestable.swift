//
//  APIHandlerTestability.swift
//  TestosUnitoWithoutXCT
//
//  Created by Jerry Ren on 8/4/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
  
protocol SessionProtocol {
    func fetchingData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: SessionProtocol {
    
    func fetchingData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: url, completionHandler: completion)
        task.resume()
    }
}

class APIHandlerTestable {
    
    let urlSession: SessionProtocol
    
    init(session: SessionProtocol) {
        self.urlSession = session
    }
    
    let urlString = "https://jsonplaceholder.typicode.com/todos"
    
    func fetchingToDoItems(completionHandler: @escaping ([ToDoModel]?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil)
            return
        }
          
        urlSession.fetchingData(url: url) { (data, response, error) in
             
                   URLSession.shared.dataTask(with: url) { (data, response, error) in
                       guard let resp = response as?  HTTPURLResponse else {
                           completionHandler(nil)
                           return }
                       
                       print("status code is: ", resp.statusCode)
                       
                    // if resp.statusCode == 200 {
                    
                    if error == nil {
                           do {
                               let models = try JSONDecoder().decode([ToDoModel].self, from: data!)
                               completionHandler(models)
            //                   print("models is: ", models)
                           } catch {
                               completionHandler(nil)
                               print("Parsing failure: \(error.localizedDescription)")
                           }
                       }
                   }
                  .resume()
                }
        

    }
}


//class APIHandlerTestability {
//
//    let urlString = "https://jsonplaceholder.typicode.com/todos"
//
//    func fetchingToDoItems(completionHandler: @escaping ([ToDoModel]?) -> Void) {
//
//        guard let url = URL(string: urlString) else { return }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let resp = response as?  HTTPURLResponse else {
//                completionHandler(nil)
//                return }
//
//            print("status code is: ", resp.statusCode)
//
//            if resp.statusCode == 200 {
//                do {
//                    let models = try JSONDecoder().decode([ToDoModel].self, from: data!)
//                    completionHandler(models)
//                    print("models is: ", models)
//                } catch {
//                    completionHandler(nil)
//                    print("Parsing failure: \(error.localizedDescription)")
//                }
//            }
//        }
//       .resume()
//
//    }
//}

// MARS: - Mocking - instead of having an actual object, we make a dummy object






//struct ToDoModel: Codable {
//    var userID: String
//}
 
// cheat mode haha

struct ToDoModel: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

typealias TDM = [ToDoModel]
  
