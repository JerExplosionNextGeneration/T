//
//  APIDealer.swift
//  CodableMvvmUnitTestPractice
//
//  Created by Jerry Ren on 8/18/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

class APIDealer {
    
    var genericClosure: ((Data?, URLResponse?, Error?) -> ())?
    
    func pullingData(stringURL: String) {
        
        guard let urlUnwrapped = URL(string: stringURL) else {
            genericClosure?(nil, nil, NetworkErros.urlNotValid)
            print(NetworkErros.urlNotValid.localizedDescription)
            return }
        
        URLSession.shared.dataTask(with: urlUnwrapped) { (data, response, erro) in
            DispatchQueue.main.async {
                self.genericClosure?(data, response, erro)
            }
        }
        .resume()
    }
}

enum NetworkErros: Error {
  case urlNotValid
  case dataEmpty
}
      
















// MARK: - some helpers

protocol SessionProtocol {
  func gettingDataSimulation(with stringURL: String, completion: @escaping (Data?, Error?) -> Void)
}

struct SimulatedSession: SessionProtocol {
  let erro: Error?
  let data: Data?
  
  func gettingDataSimulation(with stringURL: String, completion: @escaping (Data?, Error?) -> Void) {
    completion(data, erro)
  }
}
