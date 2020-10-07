//
//  BinaTreeSertion.swift
//  Algo
//
//  Created by Jerry Ren on 10/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

class Binenode<DesiredType> {
    var val: DesiredType
    init(val: DesiredType) {
        self.val = val
    }
    var right: Binenode?
    var left: Binenode?
}

class BineSearchTree {
    
    var root: Binenode<Int>?
    
    func insertion(intVal: Int) {
        let newNode = Binenode(val: intVal)
        
        if let rootNode = self.root {
            self.insertionHelper(rootNode, newNode)
        }
        else {
            self.root = newNode
        }
    }
    
    func insertionHelper(_ root: Binenode<Int>, _ newNode: Binenode<Int>) {
        if newNode.val > root.val {
            if let rightNode = root.right {
                self.insertionHelper(rightNode, newNode)
            } else {
                root.right = newNode
            }
        } else {
            if let leftNode = root.left {
                self.insertionHelper(leftNode, newNode)
            } else {
                root.left = newNode
            }
        }
    }
}
