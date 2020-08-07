//
//  ToDoLoViewController.swift
//  TestosUnitoWithoutXCT
//
//  Created by Jerry Ren on 8/4/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class ToDoLoViewController: UIViewController, ToDoListDelegate {

    @IBOutlet var toDoTable: UITableView!
    
    var items = [ToDoModel]()
    
    var dsDelegate: ToDoLoDataSourceDelegate!
    
    lazy var apiHandler: APIHandlerTestable = {
        APIHandlerTestable(session: URLSession.shared)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        setUpToDoList()

    }   
    
    func setUpToDoList() {
        
        dsDelegate = ToDoLoDataSourceDelegate()
        toDoTable.delegate = dsDelegate
        toDoTable.dataSource = dsDelegate
        
        dsDelegate.fetchItems { // completion handler in the original is key
            self.toDoTable.reloadData()
        }
    }
    
    func didSelectRow(index: Int) {
        print("Selecting row at", index)     
    }
}


// MARK: - Older way

// extension ToDoLoViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cello = toDoTable.dequeueReusableCell(withIdentifier: "id", for: indexPath)
//        let model = items[indexPath.row]
//        cello.textLabel?.text = String(describing:  model.id)
//        cello.detailTextLabel?.text = model.title
//
//        return cello
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        items.count
//    }
//}
// func fetchItems() {
//        let apiHandle = APIHandlerTestable(session: URLSession.shared)
//        apiHandle.fetchingToDoItems { (toDos) in
//            self.items = toDos!
//            DispatchQueue.main.async {
//                self.toDoTable.reloadData()
//            }
//        }
//    }
