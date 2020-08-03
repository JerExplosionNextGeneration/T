//
//  PViewController.swift
//  Navy
//
//  Created by Jerry Ren on 7/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class PViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func PopToSettings(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func pushToM(_ sender: UIButton) {
        let sBoard = UIStoryboard.init(name: "Main", bundle: nil)
               let destinoVC = sBoard.instantiateViewController(withIdentifier: "MViewController")
            //   navigationController?.pushViewController(destinoVC, animated: true)
        navigationController?.crossDissolve(destinoVC)
        
    }
}
