//
//  MViewController.swift
//  Navy
//
//  Created by Jerry Ren on 7/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class MViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var notoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notoTextView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cust", style: .plain, target: nil, action: nil)
        // backbarbutton
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("textView began")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("textView finished")
    }     
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        return true
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        var upperTextField: UITextField?
        var lowerTextField: UITextField?
        
        let custAlertCon = UIAlertController(title: "Sign in", message: "sign in or go home", preferredStyle: .alert) // .actionSheet
        
        let alertAct = UIAlertAction(title: "Log in", style: .default) { (act) -> Void in
            
            if let lowerText = lowerTextField?.text {
                print(lowerText)
            } else {
                print("lower empty")
            }
            guard let upperText = upperTextField?.text else { return
                print("nothing entered in upper")  }
        }
        
        custAlertCon.addTextField { (txtFieldUpper) -> Void in
            upperTextField = txtFieldUpper
            upperTextField?.placeholder = "Upper Placeholder"
        }
        
        custAlertCon.addTextField { (txtFieldLower) in
            lowerTextField = txtFieldLower
            lowerTextField?.placeholder = "Lower Placeholder"
        }
        
        custAlertCon.addAction(alertAct)
        present(custAlertCon, animated: true, completion: nil)
           
    }
    
    @IBAction func PopToSpecified(_ sender: UIButton) {
        guard let viewCArray = navigationController?.viewControllers else {return}
        let vcCounter = viewCArray.count
        
        navigationController?.popToViewController(viewCArray[vcCounter - 2], animated: true)
        print(viewCArray)
    }       
}
