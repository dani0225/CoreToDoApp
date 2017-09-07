//
//  ViewController.swift
//  CoreToDoApp
//
//  Created by Admin on 07/09/2017.
//  Copyright © 2017 home. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var tableView: UITableView!
    
    var tasks:[Task] = []
    //[Task] is the entity name
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // get the data from core data
        getData()
        
    
        //reload the table view
        tableView.reloadData()
    }
    
    
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell()
        
        
        let task = tasks[indexPath.row]
        
        if task.isImportant
        {
            cell.textLabel?.text = "‼️\(task.name!)"
        }
        else
        {
            cell.textLabel?.text = task.name!
        }
        

        return cell
    }
    
    
    
    func getData()
    {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
        tasks =  try context.fetch(Task.fetchRequest())
        }
        catch
        {
            print("Fetching failed")
        }
    }

}

