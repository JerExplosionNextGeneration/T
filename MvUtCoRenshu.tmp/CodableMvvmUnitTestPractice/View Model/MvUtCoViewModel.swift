//
//  MvUtCoViewModel.swift
//  CodableMvvmUnitTestPractice
//
//  Created by Jerry Ren on 8/18/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class MvUtCoViewModel {
    
    var iProduct: IProductModel?
    var closureUponCompletion: (() -> ())?
    var erro: Error?
    var response: URLResponse?
    let apiDealer = APIDealer.init()
    
    func gettingDataForVM(stringURL: String) {
        
        apiDealer.pullingData(stringURL: stringURL)
        
        apiDealer.genericClosure = {
            
            (data, response, erro) in
            print(data)
            print(response?.mimeType)
            
            guard let data = data else {
                print(NetworkErros.dataEmpty.localizedDescription)
                return
            }
            
            do {
                self.iProduct = try JSONDecoder().decode(IProductModel.self, from: data)
            } catch {
                print(error.localizedDescription)
                print("good catch")
            }
            self.erro = erro
            self.response = response
            self.closureUponCompletion?()
        }
        return
    }
    
    func gettingErro() -> String {
        return "mock error"
    }
    
    func gettingNumbOfRows() -> Int? {
        return iProduct?.results.count
    }
    
    func gettingObject(index: Int) -> IProductModel? {
        return iProduct
    }
}
          
 
