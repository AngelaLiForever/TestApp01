//
//  ViewController.swift
//  TestApp01
//
//  Created by Angela Li on 2019-08-21.
//  Copyright © 2019 Angela Li. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{

    var itemArray = [Item]()
    
    var clickedCellText = ""
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Angela: In case the default is empty, if not empty store the default item to Array
        
        let newItem0 = Item()
        newItem0.title = "Hello World"
        itemArray.append(newItem0)

        let newItem1 = Item()
        newItem1.title = "How Are You"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "I Am Fine"
        itemArray.append(newItem2)
        
        
        
        
        if let items = defaults.array(forKey: "itemArray") as? [Item] {
            itemArray = items
        }

//        if let cellText = defaults.string(forKey: "clickedCellText") {
//           clickedCellText = cellText
//        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
       // self.defaults.set(self.itemArray, forKey: "itemArray")
//        self.defaults.set(self.itemArray[indexPath.row], forKey: "clickedCellText")
//
//        let defaultCelltext = defaults.object(forKey:"clickedCellText")
        
        print("hi")
//        print(defaultCelltext ?? "fail to display default cell contents")

    }
    
    
    @IBAction func displayPressed(_ sender: UIBarButtonItem) {
        
        //This is the variable that let user to enter everywhere in the curren function
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Pressed Display Button", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Display", style: .default) { (action) in
            //what will happen onece the user clicks the display button on our UIAlert
            //Add the added field in the Array
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "itemArray")
            
            
            //This is to load the entered data and display in the cell
            self.tableView.reloadData()
            
        }
        
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder = "Click Display"
            //get the data from the textField
            textField = alertTextField

        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
}

