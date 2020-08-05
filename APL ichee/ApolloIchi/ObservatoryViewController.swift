//
//  ObservatoryViewController.swift
//  ApolloIchi
//
//  Created by Jerry Ren on 7/14/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class ObservatoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.post(name: <#T##NSNotification.Name#>, object: <#T##Any?#>, userInfo: <#T##[AnyHashable : Any]?#>)
        
        
        // MARS: - code from stackOverFlow
        guard let url = Bundle.main.url(forResource: "some", withExtension: "plist") else { return }
        let soundsData = try! Data(contentsOf: url)
        let myPlist = try! PropertyListSerialization.propertyList(from: soundsData, options: [], format: nil)
        print(myPlist)
     
    }
    



}
