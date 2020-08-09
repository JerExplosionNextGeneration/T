//
//  ViewMModel.swift
//  VMMVMMV
//
//  Created by Jerry Ren on 8/7/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

class ViewMModel {
    
    var closure: (() -> ())? // no parameter needed, just signaling that the communication chain has completed when needed 
    
    var error: Error?
    var uArray = [UserInfo]()
    var response: URLResponse?
    let apiHandled = APIHandled.init()
    

    func getData(urlString: String) {
        apiHandled.gettingData(urlString: urlString)
        
        apiHandled.genericClosure = {
            (data, response, erro) in
            print(response)
            do {
                self.uArray = try JSONDecoder().decode([UserInfo].self, from: data!)
            } catch {
                print("good catch")
            }
                
            self.error = erro
            self.response = response
            self.closure?()
        }
        return
    }
    
    func getRows() -> Int {
        return uArray.count
    }
    
    func getObject(index: Int) -> UserInfo {
        print(index)
        return uArray[index]
    }
    
    func getError() -> String {
        return "erroorro"
       //     error!.localizedDescription
        // self.erroString
    }
}
      
  
