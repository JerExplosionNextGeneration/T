//
//  CrossDissolutionCollection.swift
//  Navy
//
//  Created by Jerry Ren on 7/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

import UIKit

extension UINavigationController {
    func crossDissolve(_ viewController: UIViewController) {
        
        let cdTransition = CATransition()
        cdTransition.duration = 0.73
        cdTransition.type = CATransitionType.fade
        view.layer.add(cdTransition, forKey: nil)
        pushViewController(viewController, animated: false)
        
    }
}
