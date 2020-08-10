//
//  CalcClass.swift
//  TestosUnitoWithoutXCT
//
//  Created by Jerry Ren on 8/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

class CalcClass {
    
    func addition(num1: Int, num2: Int) -> Int {
      let resul = num2 + num1
        return resul
    }
    
    func subtraction(num1: Int, num2: Int) -> Int {
      let resul = num1 - num2
        return resul
    }
    
    func multiplication(num1: Int, num2: Int) -> Int {
      let resul = num2 * num1
        return resul
    }
    
    func division(num1: Int, num2: Int) -> Int {
 //       let resul = num1 * num1 / num2
        guard num2 != 0 else { return -1313113}
        let resul = num1 / num2
        return resul
    }
    
}

