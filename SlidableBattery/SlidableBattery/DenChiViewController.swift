//
//  DenChiViewController.swift
//  SlidableBattery
//
//  Created by Jerry Ren on 7/9/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class DenChiViewController: UIViewController {
    
    @IBOutlet weak var denchiImageView: UIImageView!
    
    @IBOutlet weak var senDenImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .some(UIColor.black)
    }
    
    @IBAction func horizontalSliding(_ sender: UISlider) {

        var denchi: String? = "3"
        var senDen: String? = "graph9"
        
        switch sender.value {
        case 0.0..<0.1:
            denchi = "0"
        case 0.1..<0.2:
            denchi = "1"
        case 0.2..<0.3:
            denchi = "2"
        case 0.3..<0.4:
            denchi = "3"
        case 0.4..<0.5:
            denchi = "4"
        case 0.5..<0.6:
            denchi = "5"
        case 0.6..<0.7:
            denchi = "6"
        case 0.7..<0.8:
            denchi = "7"
        case 0.8..<0.9:
            denchi = "8"
        case 0.9...1.0:
            denchi = "9"
        default:
            denchi = "5"   
        }
        
        switch sender.value {
        case 0.0...0.33:
            senDen = "graph3"
        case 0.33..<0.67:
            senDen = "graph6"
        case 0.67...1.0:
            senDen = "graph9"
        default:
            senDen = "graph6"
        }  
        guard let unwrappedSenDen = senDen else { return }
        guard let unwrappedDenchi = denchi else { return }
        
        senDenImageView.image = UIImage(named: unwrappedSenDen)
        denchiImageView.image = UIImage(named: unwrappedDenchi)

    }
}


