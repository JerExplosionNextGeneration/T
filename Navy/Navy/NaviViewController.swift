//
//  NaviViewController.swift
//  Navy
//
//  Created by Jerry Ren on 7/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class NaviViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var forbiddenLabel: UILabel!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtInput.delegate = self
      //  view.backgroundColor = .some(.init(ciColor: .cyan))
        createRightButton()
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(hidingKeyboard))
        view.addGestureRecognizer(gesture)
        
        forbiddenLabel.layer.cornerRadius = 30
        forbiddenLabel.clipsToBounds = true
    }
    
    @objc func hidingKeyboard() {
        txtInput.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hidingKeyboard()
        annoyingAlert()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtInput.textColor = .white
        txtInput.backgroundColor = .clear
        txtInput.layer.borderWidth = 2.0
        txtInput.layer.borderColor = UIColor.white.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtInput.backgroundColor = .white
        
        txtInput.layer.borderColor = UIColor.clear.cgColor
        forbiddenLabel.text = "⚡️"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "a" {
               
            forbiddenLabel.text = "No'a'!" 
            
            txtInput.layer.borderWidth = 3.0
            txtInput.layer.borderColor = UIColor.red.cgColor
            
            return false
        }
        
        if string != "a" {
            txtInput.layer.borderWidth = 3.0
            txtInput.layer.borderColor = UIColor.white.cgColor
        }
        return true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        forbiddenLabel.text = "🔥🔥🔥"
    }
    

    func annoyingAlert() {
        let alertCon = UIAlertController(title: "Ti", message: "Mes", preferredStyle: .actionSheet)
        present(alertCon, animated: true, completion: nil)
        
        let alertAct = UIAlertAction.init(title: "act", style: .cancel) { (_) in
            alertCon.dismiss(animated: true, completion: nil)
        }
        alertCon.addAction(alertAct)
    }
    
    
    func createRightButton() {
        let riButton = UIBarButtonItem.init(title: "OpenM", style: .done, target: self, action: #selector(openGenericScreen(_:)))
        
        let rButtonTwo = UIBarButtonItem(title: "Modal", style: .plain, target: self, action: #selector(openModally))
        rButtonTwo.tintColor = .orange
        riButton.tintColor = .systemOrange
        
        self.navigationItem.rightBarButtonItem = riButton
        self.navigationItem.leftBarButtonItem = rButtonTwo
    }
    
    @IBAction func openGenericScreen(_ sender: UIButton) {
//        let sBoard = UIStoryboard.init(name: "Main", bundle: nil)
//        let destinoVC = sBoard.instantiateViewController(withIdentifier: "MViewController")
        
        let sBoard = UIStoryboard.init(name: "TBBV", bundle: nil)
        let destinoVC = sBoard.instantiateViewController(withIdentifier: "tbbvSBoardID")
        present(destinoVC, animated: true)
        
  //      navigationController?.pushViewController(destinoVC, animated: true)
    //    navigationController?.crossDissolve(destinoVC)
    }
         
    @objc func openModally() {
        let sBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let destinoVC = sBoard.instantiateViewController(withIdentifier: "MViewController")
        self.present(destinoVC, animated: true)
    }
              
    
    
    
}
              
 
