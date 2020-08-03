//
//  SettingsViewController.swift
//  Navy
//
//  Created by Jerry Ren on 7/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imgPickerController: UIImagePickerController?
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.layer.cornerRadius = 33
        
        view.alpha = 1.1
        UITabBar.appearance().backgroundColor = .black
        
        let flagValue = UserDefaults.standard.string(forKey: "flag")
    //        UserDefaults.standard.bool(forKey: "flag")
        print("Flag's value is \(flagValue)")
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage

        picker.dismiss(animated: true) {
            self.imgView.image = img
        }
    }
    
    @IBAction func pickingImage(_ sender: UITapGestureRecognizer) {
        imgPickerController = UIImagePickerController.init()
        imgPickerController?.sourceType = .photoLibrary
        imgPickerController?.delegate = self
        
        if let unwrappedImgPicker = imgPickerController {
            self.present(unwrappedImgPicker, animated: true, completion: nil)
        } else {  }
    }
 
    @IBAction func pushToNext(_ sender: UIButton) {
        let sBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let destinoVC = sBoard.instantiateViewController(withIdentifier: GloballyApplied.QvcSboardID)
        //   navigationController?.pushViewController(destinoVC, animated: true)
        navigationController?.crossDissolve(destinoVC)
    }
}    


// MARS: - <#Section Heading#>
  
//    if UIImagePickerController.isSourceTypeAvailable(.camera) { }


//let docPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
//let logsPath = docPath.appendingPathComponent("data")
//print(logsPath)
//print(docPath)
