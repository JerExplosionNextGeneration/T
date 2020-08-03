//
//  TBBVViewController.swift
//  Navy
//
//  Created by Jerry Ren on 7/13/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class TBBVViewController: UIViewController, FlowProtocol  {
    
    // flow protocol method
    func flowAnimated() {
        self.tableFlowAnima()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbbvTableView.delegate = self
        flowTable.dataSource = self
        tbbvTableView.dataSource = self
        flowTable.delegate = self
        
    }
    @IBOutlet weak var flowTable: UITableView!
    
    @IBOutlet weak var tbbvTableView: UITableView!
    
    let sportsCarArray = ["McLaren 600LT", "Porsche 718 Cayman", "Mercedes-AMG GT", "BMW M2", "Ford Mustang Shelby GT350"]
}

var statesNames = ["Hawaii", "Nevada", "New York City","Florida", "Georgia"]
var statesNicknames = [ ["Aloha State", "Pineapple State", "Rainbow State"], ["Casino State", "Silver State"], ["Peach State", "Cracker State"], ["Sunshine State", "Alligator State"], ["Empire State", "Big Apple", "The City That Never Sleeps"] ]


extension TBBVViewController: UITableViewDataSource, UITableViewDelegate, TbbvCellProtoc {
    
    // MARS: - slightly unfamiliar stuff
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            statesNicknames[indexPath.section].remove(at: indexPath.row)
            tbbvTableView.reloadData()
        }
    }
    
    // MARS: -
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        var resultSections = 1
        
        if tableView == tbbvTableView {
            resultSections = statesNames.count
        } else if tableView == flowTable {
            resultSections = 1
        }
        
        return resultSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var resultRowCount = 2
        
        switch tableView {
        case flowTable:
            3
        default:
            statesNicknames[section].count
        }
        return resultRowCount
    }
    
    @objc func goof() {
        
    }
    
    func present() {
        
        let sBoar = UIStoryboard.init(name: "TBBV", bundle: nil)
        guard let desino = sBoar.instantiateViewController(withIdentifier: "infoTransisted") as? InfoTransistedViewController else { return }
        //   navigationController?.crossDissolve(desino)
        self.present(desino, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nCell = tbbvTableView.dequeueReusableCell(withIdentifier: "tbbvCell", for: indexPath) as! TbbvCell
        
        let fCell = flowTable.dequeueReusableCell(withIdentifier: "shelfCell", for: indexPath) as! ShelfCell
        
        
        // MARS: -
        
        fCell.flowDelegate = self

        // MARS: -
        
        nCell.cellProtoc = self
        nCell.tbbvcButton.tag = indexPath.row
        
        // MARS: - add / remove target
        nCell.tbbvcButton.removeTarget(self, action: #selector(goof), for: .touchUpInside)
        nCell.tbbvcButton.addTarget(self, action: #selector(goof), for: .touchUpInside)
        // MARS: -
        
        let sect = indexPath.section
        let irow = indexPath.row
        
        nCell.textLabel?.text = "\(statesNicknames[sect][irow])"
        
        // MARS: -
        
        var ultimateCell: UITableViewCell?
        
        switch tableView {
        case flowTable:
            ultimateCell = fCell
        default:
            ultimateCell = nCell
        }
        
        return ultimateCell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var custLabel: UILabel?
        
        if tableView == tbbvTableView {
            let lbl = UILabel.init(frame: CGRect(x: 0, y: 0, width: tbbvTableView.frame.size.width - 20, height: 60))
            
            lbl.textAlignment = .center
            lbl.text = statesNames[section]
            lbl.textColor = .white
            
            switch section {
            case 0:
                lbl.backgroundColor = .systemPink
            case 1:
                lbl.backgroundColor = .orange
            case 2:
                lbl.backgroundColor = .red
            case 3:
                lbl.backgroundColor = .systemPink
            case 4:
                lbl.backgroundColor = .red
            default:
                lbl.backgroundColor = .yellow
            }
            custLabel = lbl
        }
        
        return custLabel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sBoar = UIStoryboard.init(name: "TBBV", bundle: nil)
        guard let desino = sBoar.instantiateViewController(withIdentifier: "infoTransisted") as? InfoTransistedViewController else { return }
        
        //   desino.infoToBeReceived = "to be received"
        desino.infoTransisted = statesNicknames[indexPath.section][indexPath.row]
        tbbvTableView.deselectRow(at: indexPath, animated: true)
        navigationController?.crossDissolve(desino)
        
        //  self.present(desino, animated: true)
        
    }
}


extension TBBVViewController {

        func tableFlowAnima() {
            
            tbbvTableView.reloadData()
            
            let visibles = tbbvTableView.visibleCells
            print(visibles)
            let currentTableHeight = tbbvTableView.bounds.size.height
            print(currentTableHeight)
               
            for individualCell in visibles {
                individualCell.transform = CGAffineTransform(translationX: 0, y: currentTableHeight)
            }
                
            var delayCounter = 0
            
            for cell in visibles {
                
                UIView.animate(withDuration: 1.73, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    cell.transform = CGAffineTransform.identity
                }, completion: nil)
                
                delayCounter += 1
                
            }
        }
}





















struct CarInfo{
    var carName: String?
}

struct Car {
    var cIn: [CarInfo]?
}
