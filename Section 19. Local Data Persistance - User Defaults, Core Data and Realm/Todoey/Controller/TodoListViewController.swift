//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    // when UserDefaults is called, it call all of line from UserDefaults plist and synchronize
    // so make sure that it is not for db, but for short info
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let newItem = Item(title: "Find Mike", done: false)
        let newItem2 = Item(title: "Buy Eggos", done: false)
        let newItem3 = Item(title: "Find Mike", done: false)
        
        itemArray.append(newItem)
        itemArray.append(newItem2)
        itemArray.append(newItem3)
        
        
        guard let items = defaults.array(forKey: "TodoListArray") as? [Item] else { return }
        itemArray = items
    }

    //MARK: - Tabelview Datasource Metohds
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) --> selected condition is retreive becuase it use cell again from previous
        
//        cell.textLabel?.text = itemArray[indexPath.row]
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell") --> lose selected condition when you scroll
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = item.title
        }
        
        // value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)

        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        if itemArray[indexPath.row].done {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }

//        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            // what will happen once the user clicks the Add Item button on our UIAlert
            
            let newItem = Item(title: textField.text!, done: false)
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}
