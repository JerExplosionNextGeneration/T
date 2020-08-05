//
//  AutoLayoutViewController.swift
//  ApolloIchi
//
//  Created by Jerry Ren on 7/10/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {
    
    var squareMG: UIView?
    
    var square: UIView?
    var greenSquare: UIView?
    var redSquare: UIView?
    var viewDictionary = [String:UIView]()
    
    func gettingView() -> UIView {
        let someView = UIView()
        someView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(someView)
        return someView
    }
    
    
    @IBOutlet weak var topDistanceConstraintForButton: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up yellow
        squareMG = gettingView()
        squareMG?.heightAnchor.constraint(equalToConstant: 64).isActive = true
        squareMG?.widthAnchor.constraint(equalToConstant: 65).isActive = true
        squareMG?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        squareMG?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        NSLayoutConstraint.activate([])
        
        // (obviously unfinished yet)
    }
    
    
    private func applyingConstraints(view: UIView?, attribute attr1: NSLayoutConstraint.Attribute, relatedBy relation: NSLayoutConstraint.Relation, toItem view2: UIView?, attribute attr2: NSLayoutConstraint.Attribute, multiplier: CGFloat, constant const: CGFloat) {
        
        let constraintObject = NSLayoutConstraint(item: (view ?? UIView()), attribute: attr1, relatedBy: relation, toItem: view2, attribute: attr2, multiplier: multiplier, constant: const)
        
        self.view.addConstraint(constraintObject)
    }
       
    
    
    
    

    
    override func viewDidLayoutSubviews() {
        print(topDistanceConstraintForButton)
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            self.topDistanceConstraintForButton.constant += 50
            self.view.layoutIfNeeded()
        }

    }

}
