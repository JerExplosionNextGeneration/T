//
//  TbbvCell.swift
//  Navy
//
//  Created by Jerry Ren on 7/13/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

protocol TbbvCellProtoc {
    func present()
}

class TbbvCell: UITableViewCell {

    @IBOutlet weak var tbbvcButton: UIButton!

    var closure1: (() -> ())?
    var closure2: ((Int) -> (Bool))?
    var closure3: ((Int) -> ())?
    
    var cellProtoc: TbbvCellProtoc?
    
    @IBAction func tbbvcButtonTapped(_ sender: UIButton) {
        
        print(sender.tag)
        
        
        cellProtoc?.present()
        
        closure1?()
        
    }
    

}

//extension TBBVViewController: TbbvCellProtoc {
//    func present() {
//        
//        let sBoar = UIStoryboard.init(name: "TBBV", bundle: nil)
//           guard let desino = sBoar.instantiateViewController(withIdentifier: "infoTransisted") as? InfoTransistedViewController else { return }
//        //   navigationController?.crossDissolve(desino)
//         self.present(desino, animated: true)
//        
//    }
//    
//}

// one more button 
