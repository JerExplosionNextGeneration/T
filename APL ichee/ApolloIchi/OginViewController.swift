//
//  OginViewController.swift
//  ApolloIchi
//
//  Created by Jerry Ren on 7/7/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class OginViewController: UIViewController {
    
    @IBOutlet weak var passcodeTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() { super.viewDidLoad()}
    

    @IBAction func oginButtonTapped(_ sender: UIButton) { 
        
        let passcodeEntered = passcodeTextField.text
        let usernameEntered = usernameTextField.text
        guard let lenPasscode = passcodeEntered?.count else { return }
        guard let lenUsername = usernameEntered?.count else { return }
        
        if lenPasscode == 0 && lenUsername == 0 {
            
        } else if lenUsername == 0 && lenPasscode != 0 {
            
        } else if lenUsername != 0 && lenPasscode == 0 {
            
        }
    }
    
    


}
