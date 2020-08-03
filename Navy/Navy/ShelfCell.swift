//
//  ShelfCell.swift
//  Navy
//
//  Created by Jerry Ren on 7/13/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
 
protocol FlowProtocol {
    func flowAnimated()
}

class ShelfCell: UITableViewCell {
    
    var flowDelegate: FlowProtocol?
    
    @IBOutlet weak var flowButton: UIButton!
    
    @IBAction func flowAction(_ sender: UIButton) {
        flowDelegate?.flowAnimated()
    }
    
}
