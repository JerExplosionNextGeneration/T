//
//  APIHandled.swift
//  VMMVMMV
//
//  Created by Jerry Ren on 8/7/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

class APIHandled {
    
    var genericClosure: ((Data?, URLResponse?, Error?) -> ())?
    
    func gettingData(urlString: String) {  
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, erro) in
            DispatchQueue.main.async {
                self.genericClosure?(data, response, erro)
            }
        }
        .resume()
    }
    
}
