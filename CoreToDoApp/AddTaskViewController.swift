//
//  AddTaskViewController.swift
//  CoreToDoApp
//
//  Created by Admin on 07/09/2017.
//  Copyright © 2017 home. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var isImportant: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
      let context =   (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = textField.text
        task.isImportant = isImportant.isOn
        
        //save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    

}
