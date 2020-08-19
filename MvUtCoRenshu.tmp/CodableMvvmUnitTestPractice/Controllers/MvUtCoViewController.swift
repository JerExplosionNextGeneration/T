//
//  MvUtCoViewController.swift
//  CodableMvvmUnitTestPractice
//
//  Created by Jerry Ren on 8/18/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class MvUtCoViewController: VelocityAnimateViewController {

    @IBOutlet weak var displayTable: UITableView!
    
    var mvutcoViewModel = MvUtCoViewModel.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelAndTableViewSetup()
    }
    
    func viewModelAndTableViewSetup() { // filpr
         
        displayTable.delegate = self
        displayTable.dataSource = self
        
        mvutcoViewModel.gettingDataForVM(stringURL: GloballyApplied.targetURL)
        
        DispatchQueue.main.async {
            self.mvutcoViewModel.closureUponCompletion = {
                let erro = self.mvutcoViewModel.gettingErro()
                self.displayTable.reloadData()
            }
        }
             
    }
}

   
