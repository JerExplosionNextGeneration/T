//
//  QViewController.swift
//  Navy
//
//  Created by Jerry Ren on 7/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class QViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lbl = UILabel.init(frame: CGRect(x: 10, y: 10, width: 30, height: 20))
        lbl.text = "007"
        lbl.textColor = .clear
        navigationItem.titleView = lbl // shakky

    }

    @IBAction func popToNext(_ sender: UIButton) {
        let sBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let destinoVC = sBoard.instantiateViewController(withIdentifier: "PViewController")
     //   navigationController?.pushViewController(destinoVC, animated: true)
        navigationController?.crossDissolve(destinoVC)
    }
    
}
  
//  let lbl = UILabel(frame: CGRect(x: 10, y: 50, width: 230, height: 21))
//        lbl.textAlignment = .center //For center alignment
//        lbl.text = "title"
//        lbl.textColor = .white
//        lbl.backgroundColor = .lightGray//If required
//        lbl.font = UIFont.systemFont(ofSize: 17)
//
//        //To display multiple lines in label
//        lbl.numberOfLines = 0 //If you want to display only 2 lines replace 0(Zero) with 2.
//        lbl.lineBreakMode = .byWordWrapping //Word Wrap
//        // OR
//        lbl.lineBreakMode = .byCharWrapping //Charactor Wrap
  
