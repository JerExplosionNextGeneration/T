//
//  DisplayTableExtensions.swift
//  CodableMvvmUnitTestPractice
//
//  Created by Jerry Ren on 8/18/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

extension MvUtCoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = displayTable.dequeueReusableCell(withIdentifier: GloballyApplied.idOfCell, for: indexPath) as! IProductTviCell
        
        let fetchedResult = mvutcoViewModel.gettingObject(index: indexPath.row)
        cell.trackNameLabel.text = fetchedResult?.results[indexPath.row].trackName
        cell.detailedDescriptionLabel.text = fetchedResult?.results[indexPath.row].description
        cell.sellerUrlLabel.text = fetchedResult?.results[indexPath.row].sellerUrl ?? "This Seller's URL = empty"
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numbOfR = mvutcoViewModel.gettingNumbOfRows() else { return 0 }
        return numbOfR
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        displayTable.deselectRow(at: indexPath, animated: true)
    }
}

