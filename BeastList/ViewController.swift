//
//  ViewController.swift
//  BeastList
//
//  Created by Grant Brooks on 9/11/17.
//  Copyright © 2017 Grant Brooks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]
    
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        
        if (taskTextField.text?.characters.count)! > 0 {
            tasks.append(taskTextField.text!)
            print(tasks)
            taskTextField.text = ""
            tableView.reloadData()
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDataSource {
    // MAKE SURE THESE ARE WITHIN UITableViewDataSource EXTENSION!
    // How many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return tasks.count
    }
    
    // How should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        // set the text label
        cell.textLabel?.text = tasks[indexPath.row]
        // be sure to return the cell
        return cell
    }
}

