//
//  ViewController.swift
//  TestosUnitoWithoutXCT
//
//  Created by Jerry Ren on 8/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numbOneTextField: UITextField!
    @IBOutlet weak var numbTwoTextField: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    
    let calcC = CalcClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchingItems()
    }

    @IBAction func mult(_ sender: UIButton) {
        let numbOne = retrieveNumbInt()[0]
        let numbTwo = retrieveNumbInt()[1]
        let resul = calcC.multiplication(num1: numbOne, num2: numbTwo)
        updateResulRabel(value: resul)
    }
    
    @IBAction func sub(_ sender: UIButton) {
        let numbOne = retrieveNumbInt()[0]
        let numbTwo = retrieveNumbInt()[1]
        let resul = calcC.subtraction(num1: numbOne, num2: numbTwo)
        updateResulRabel(value: resul)
    }
    
    @IBAction func add(_ sender: UIButton) {
        let numbOne = retrieveNumbInt()[0]
        let numbTwo = retrieveNumbInt()[1]
        let resul = calcC.addition(num1: numbOne, num2: numbTwo)
        updateResulRabel(value: resul)
    }
    
    @IBAction func div(_ sender: UIButton) {
        let numbOne = retrieveNumbInt()[0]
        let numbTwo = retrieveNumbInt()[1]
        let resul = calcC.division(num1: numbOne, num2: numbTwo)
        updateResulRabel(value: resul)
    }     
    
    func updateResulRabel(value: Int) {
        self.displayLabel.text = String(value)   
    }
    
    func retrieveNumbInt() -> [Int] {
        guard let numbOne = Int(numbOneTextField.text ?? ""),
        let numbTwo = Int(numbTwoTextField.text ?? "") else { return  [113, 120] }
        return [numbOne, numbTwo]
    }
    
    // MARS: -
    
    
//    func fetchingItems() {
//        let apiHandlerTestable = APIHandlerTestability()
//
//        apiHandlerTestable.fetchingToDoItems { (toDos) in
//            print(toDos)
//        }
//    }
    
    func fetchingItems() {
        let apiHandlerTestable = APIHandlerTestable(session: URLSession.shared) // urlsession.shared is already conforming to the sessionProtocol, thus making this would work 
        
        apiHandlerTestable.fetchingToDoItems { _ in }
    }
     
}

