//
//  NimbleQuickTestos.swift
//  SelfGeneratedTestsBundle
//
//  Created by Jerry Ren on 8/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

@testable import TestosUnitoWithoutXCT

import XCTest
import Quick
import Nimble


class CalcTestosWithNimbleQuickness: QuickSpec {
    override func spec() {
        
        var sut: CalcClass!
        
        beforeEach {
            sut = CalcClass()
        }
        
        afterEach {
            sut = nil
        }
        
        describe("Calc Operations") {
            
            // MARS: - Multiply
            
            context("Test multiplication") {
                it("one numb positive one numb negative") {
                    let resul = sut.multiplication(num1: 11, num2: -11)
                    expect(resul).to(equal(-121))
                }
                it("two numbs negative") {
                    let resul = sut.multiplication(num1: -110, num2: -110)
                    expect(resul).to(equal(12100))
                }
            }
            
            // MARS: - Subtract
            
            context("Test subtraction") {
                it("one negative one positive") {
                    let resul = sut.subtraction(num1: 13 , num2: -13)
                    expect(resul).to(equal(26))
                }
                it("two positives") {
                    let resul = sut.subtraction(num1: 13 , num2: 13)
                    expect(resul).to(equal(0))
                }
            }
            
            // MARS: - Divide
            
            context("Test division") {
                it("two numbs both negative") {
                    let resul = sut.division(num1: -12, num2: -17)
                    expect(resul).to(equal(0))
                }
                it("one numb positive one numb negative") {
                    let resul = sut.division(num1: 1025, num2: 250)
                    expect(resul).to(equal(4))
                }
                it("divisor is zero") {
                    let resul = sut.division(num1: 1025, num2: 0)
                    expect(resul).to(equal(-1313113))
                }
            }

            // MARS: - Add
            
            context("Test addition") {
                it("when two numbs are positive") {
                    let resul = sut.addition(num1: 7, num2: 11)
                    expect(resul).to(equal(18))
                }
                it("when two numbs are negative") {
                    let sut = CalcClass()
                    let resul = sut.addition(num1: -7, num2: -11)
                    expect(resul).to(equal(-18))
                }
            }
        
        }
    }
}



class NimbleQuickTestos: QuickSpec {
    
    override func spec() { 
        
        describe("User name testos") {
            
            context("Valid user name") {
                it("valid user name 1") {
                    
                }
                it("Valid user name 2") {

                }
            }
            describe("Passcode testos") {
                it("Minimum 13 characters") {
                    
                }
            }
        }
    }
    
}
