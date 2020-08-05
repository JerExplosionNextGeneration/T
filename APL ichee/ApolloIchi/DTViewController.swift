//
//  DTViewController.swift
//  ApolloIchi
//
//  Created by Jerry Ren on 7/10/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class DTViewController: UIViewController {
    
    var square: UIView?
    var squareGreen: UIView?
    var squareRed: UIView?
    var viewDictionary = [String:UIView]()
    
    
    func getView ()->UIView {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(aView)
        return aView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       //set up yellow
        square = getView()
        applyConstraits(view: (square ?? UIView()), attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 32)
        applyConstraits(view: (square ?? UIView()), attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 133)
        applyConstraits(view: (square ?? UIView()), attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        applyConstraits(view: (square ?? UIView()), attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        self.square?.backgroundColor = .yellow

        
        //set up green
        squareGreen = getView()
        let widthConstraintsquareGreen = NSLayoutConstraint(item: (squareGreen ?? UIView()), attribute: .width, relatedBy: .equal, toItem: square, attribute: .width, multiplier: 1.0, constant: 0) 
        
        let heightConstraintsquareGreen = NSLayoutConstraint(item: (squareGreen ?? UIView()), attribute: .height, relatedBy: .equal, toItem: square, attribute: .height, multiplier: 1.0, constant: 0)
        
        let centerXsquareGreen = NSLayoutConstraint(item: (squareGreen ?? UIView()), attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 80)
        
        let centerYsquareGreen = NSLayoutConstraint(item: (squareGreen ?? UIView()), attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 80)
        
        self.view.addConstraint(widthConstraintsquareGreen)
        self.view.addConstraint(heightConstraintsquareGreen)
        self.view.addConstraint(centerXsquareGreen)
        self.view.addConstraint(centerYsquareGreen)
        self.squareGreen?.backgroundColor = .green

        //set up red using VFL
        squareRed = getView()
        viewDictionary["squareRed"] = squareRed
        self.squareRed?.backgroundColor = .red
        var metrics = [String: Float]()
        metrics["edge"] = 100
        metrics["width"] = 100
        metrics["height"] = 100

        let HConstdraintRed = NSLayoutConstraint.constraints(withVisualFormat: "H:|-edge-[squareRed(width)]", options: [], metrics: metrics, views: viewDictionary)
         let vConstdraintRed = NSLayoutConstraint.constraints(withVisualFormat: "V:|-600-[squareRed(height)]", options: [], metrics: metrics, views: viewDictionary)
        view.addConstraints(HConstdraintRed)
        view.addConstraints(vConstdraintRed)
        
        //anchors
        
        
    }
    
    
    
    
    func applyConstraits( view: UIView?, attribute attr1: NSLayoutConstraint.Attribute, relatedBy relation: NSLayoutConstraint.Relation, toItem view2: UIView?, attribute attr2: NSLayoutConstraint.Attribute, multiplier: CGFloat, constant c: CGFloat) {
        let constraintObj = NSLayoutConstraint(item: (view ?? UIView()), attribute: attr1, relatedBy: relation, toItem: view2, attribute: attr2, multiplier: multiplier, constant: c)
        self.view.addConstraint(constraintObj)
    }
    

    

}
