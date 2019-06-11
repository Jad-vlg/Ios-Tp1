//
//  TodoListViewController.swift
//  IosCours3
//
//  Created by epita on 17/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var todoItems = [ToDoItem]();
    var isEditable = false;
    var isChanging = false;
    var indexChange = 0;
    
    func initTable()
    {
        //var t1 = ToDoItem(itemName: "item1");
        //todoItems.append(t1);
        //var t2 = ToDoItem(itemName: "item2");
        //todoItems.append(t2);
        //var t3 = ToDoItem(itemName: "item3");
        //todoItems.append(t3);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initTable();
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
            if indexPath.row < todoItems.count {
                let todoItem = todoItems[indexPath.row]
                todoItem.completed = !todoItem.completed
                tableView.reloadRows(at: [indexPath], with: .none)
            } }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "cell1", for: indexPath)
        if indexPath.row < todoItems.count {
            let todoItem = todoItems[indexPath.row]
            indexChange = indexPath.row
            cell.textLabel?.text = todoItem.itemName
            cell.textLabel?.textColor = todoItem.color
            if todoItem.completed {
                cell.accessoryType = .checkmark
            }
            else
            {
                cell.accessoryType = .none
            }
        }
        
        
        return cell }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoItems.count
    }
    
    @IBAction func unwindToList(_ segue:UIStoryboardSegue){
        print(isChanging)
        if (isChanging == false)
        {
        if let source = segue.source as? AddTodoItemViewController {
            if let item = source.todoItem {
                todoItems.append(item)
                tableView.reloadData()
            }
        }
           
        }
        else
        {
        if let source = segue.source as? AddTodoItemViewController {
            if let item = source.todoItem {
                todoItems.remove(at: indexChange)
                todoItems.insert(item, at: indexChange)
                tableView.reloadData()
            }
        }
             isChanging = false
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    @IBAction func editButton(_ sender: Any) {
        isEditable = !isEditable;
        
        self.tableView.isEditing = isEditable
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.todoItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt source: IndexPath, to destination: IndexPath) {
        let movedObject = self.todoItems[source.row]
        todoItems.remove(at: source.row)
        todoItems.insert(movedObject, at: destination.row)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "editText")
        {
            self.isChanging = true
        }
    }
    

}
