//
//  ViewController.swift
//  TestApp01
//
//  Created by Angela Li on 2019-08-21.
//  Copyright © 2019 Angela Li. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{

    let itemArray = ["Hello World","How Are You","I Am Fine"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
        
        
        //Create a checkmark in there
     //   tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        
        //Make the cell not highlighted
       //tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
}

