//
//  ToDoLoDataDele.swift
//  TestosUnitoWithoutXCT
//
//  Created by Jerry Ren on 8/4/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

protocol ToDoListDelegate {
    func didSelectRow(index: Int)
}

class ToDoLoDataSourceDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
      
    var delegate: ToDoListDelegate?
    var items: [ToDoModel] = []
    
    lazy var apiHandle: APIHandlerTestable = {
        APIHandlerTestable(session: URLSession.shared)
    }()
    
    func fetchItems(completion: @escaping () -> Void) {
        apiHandle.fetchingToDoItems { (toDos) in
            self.items = toDos!
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    // MARS: -
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if items.isEmpty {
            items.append(ToDoModel(userID: 3, id: 3, title: "viorsa", completed: true))
        }
        let selectedModel = items[indexPath.row]
        print(selectedModel.title)
        
        delegate?.didSelectRow(index: indexPath.row)
    }
       

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cello = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        
  
//        if items.isEmpty {
//            items.append(ToDoModel(userID: 3, id: 3, title: "viorsa", completed: true))
//        }
//
        let model = items[indexPath.row]
        print("model is", model)
        
        cello.textLabel?.text = String(describing:  model.id)
        cello.detailTextLabel?.text = model.title
        
        print(cello.textLabel?.text)
        
        return cello
    }
      
    
    
    
    
}
