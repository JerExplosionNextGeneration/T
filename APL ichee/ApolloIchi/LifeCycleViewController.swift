//
//  LifeCycleViewController.swift
//  ApolloIchi
//
//  Created by Jerry Ren on 7/1/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class LifeCycleViewController: UIViewController {
    
    // lifecycle reversed in order
    
    override func viewDidDisappear(_ animated: Bool) { }
    
    override func viewWillDisappear(_ animated: Bool) { }
    
    override func viewDidAppear(_ animated: Bool) { }
    
    override func viewWillAppear(_ animated: Bool) { }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .some(.cyan)
        CompactMapEx()
        MapEx()
        FlatMapEx()
        
        FilterEx()
        
        let kingsley = BatchMate(name: "Kingsley")
        let sheryl = BatchMate(name: "Sheryl")
        let chen = BatchMate(name: "Chen")
        let omar = BatchMate(name: "Omar")
        let batchmateList = [kingsley, sheryl, chen, omar].map({$0.name})
        batchmateList.filter({$0.count >= 5})
    }

}


extension LifeCycleViewController {
    
    func CompactMapEx() {
        let op1: String? = "Lok"
        let op2: String? = "Mit"
        
        let ar = [op1, op2, nil, ""]
        let unwrappedAr = ar.compactMap({$0})
        print(unwrappedAr)
    }
    
    func MapEx() {
        let mappable = ["shabee", "nubee"].map({$0.capitalized})
        print(mappable)
    }
    
    func FlatMapEx(){
        let flapped = [[3, 1], [11, 101], [77, 13]].flatMap({$0})
        print(flapped)
    }
    
    // MARS: -
    
    func FilterEx() {
        let filteration = ["shabee", "nubee", "kubee"].filter({$0.count <= 5})
        print(filteration)
    }
}

class BatchMate {
    var name: String
    init(name: String) {
        self.name = name
    }
}


