//
//  MemoryLeakViewController.swift
//  ApolloIchi
//
//  Created by Jerry Ren on 7/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class MemoryLeakViewController: UIViewController {
    
    override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = .some(.clear)
          
          owner.address = address
          address.owner = owner

        
        NotificationCenter.default.addObserver(self, selector: #selector(receivingNotification(notific:)), name: NSNotification.Name(rawValue: "kinfo"), object: nil)
      }
    
    @objc func receivingNotification(notific: Notification) {
        print("received")
        print(notific.userInfo?["kinfo"])
    }
    
    // MARS: - above notificationCenter code not complete yet 
    
    
    
    
    @IBAction func activateOgin(_ sender: UIButton) {
        let sBoard = UIStoryboard.init(name: GloballyUsed.OginSBoardName, bundle: nil)
        let destinationVC = sBoard.instantiateViewController(withIdentifier: GloballyUsed.OginSBoardID)
        navigationController?.pushViewController(destinationVC, animated: true)
         
        guard let distinctTitle = sender.title(for: .normal) else { return }
        let buttonTag = sender.tag

        switch sender.tag {
        case 2:
            print("button tag is 2")
        case 1:
            print("button tag is 1")
        default:
            print("tag defaulted")
        }
        
        switch sender.title(for: .normal) {
        case "ExtraOginButton":
            print("ExtraOginButton has tag 2")
        case "ActivateOgin":
            print("ActivateOgin has tag 1")
        default:
            print("title defaulted")
        }
    }
    
    @IBAction func ActivateGista(_ sender: UIButton) {
        let sBoard = UIStoryboard.init(name: GloballyUsed.RegistrationSBoardName, bundle: nil)
        let destinationVC = sBoard.instantiateViewController(withIdentifier: GloballyUsed.RegistrationSBoardID)
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    deinit {
        print("deinitialization")  
    }
    
    @IBAction func segmentedActivation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            print("1")
        }
        
        switch sender.selectedSegmentIndex {
        case 1:
            self.generateButton(howMany: 2)
        case 0: self.generateButton(howMany: 3)
        default:
            print("defaulted")
        }
    }

    
    @IBAction func sliderActivation(_ sender: UISlider) {
        view.alpha = CGFloat(sender.value)
    }
    
    @objc func ob() {
        print("objc~")
        
        #warning("my own warning message (look to the right)")
        // #error("my own #error haha")
    }
    private func generateButton(howMany: Int) {
        for c in 0..<howMany {
            
            let buttonFrame = CGRect(x: 155, y: view.frame.size.height / 1.5 + 43 * CGFloat(c), width: 111, height: 33)
                
            let individualButton = UIButton.init(frame: buttonFrame)
            individualButton.layer.cornerRadius = 10
            
            individualButton.addTarget(self, action: #selector(ob), for: UIControl.Event.touchUpInside)
            individualButton.backgroundColor = .some(UIColor.systemTeal)
            individualButton.setTitle("\(c)", for: UIControl.State.normal)
            view.addSubview(individualButton)
              
            let yOfLabel = individualButton.frame.origin.y
            let padding = 7
//            let singleLabel = UILabel.init(frame: CGRect(x: individualButton.frame.origin.x, y: yOfLabel, width: <#T##CGFloat#>, height: <#T##CGFloat#>))

        }
    }
    

    var owner = Owner.init()
    var address = Address.init()

}
    
class Owner {
    weak var address: Address?
    deinit {
        print("owner deinited")
    }
}

class Address {
    var owner: Owner? // make one of 'em weak is enough
    deinit {
        print("address deinited")
    }
}
