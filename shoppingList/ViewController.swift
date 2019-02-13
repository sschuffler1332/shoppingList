//
//  ViewController.swift
//  shoppingList
//
//  Created by Samuel Schuffler on 2/8/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//  Sam Rocks

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var items:[Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let itemOne = Item(name: "Milk")
        let itemTwo = Item(name: "Blueberries")
        items = [itemOne, itemTwo]
        let itemThree = Item(name: "Crackers")
        items.append(itemThree)
        let itemFour = Item(name: "Ryan Kaiser")
        items.append(itemFour)
    }

    @IBAction func newItemButtonPressed(_ sender: Any) {
        if let newItemName = newItemTextField.text, newItemName != ""{
            let newItem = Item(name: newItemName)
            items.append(newItem)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") {
            let itemname = items[indexPath.row].name
            cell.textLabel?.text = itemname
            
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

