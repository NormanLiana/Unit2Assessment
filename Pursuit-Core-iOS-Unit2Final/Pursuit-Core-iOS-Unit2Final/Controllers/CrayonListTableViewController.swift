//
//  CrayonListTableViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Liana Norman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonListTableViewController: UITableViewController {
    
    // MARK: - Properties
    let crayonList = Crayon.allTheCrayons

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let crayon = crayonList[indexPath.row]
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColor(red:crayon.convertHexToCGFloatNumber(color: crayon.red), green: crayon.convertHexToCGFloatNumber(color: crayon.green), blue: crayon.convertHexToCGFloatNumber(color: crayon.blue), alpha: 1.0)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToColorManipulator" {
            guard let colorChangeVC = segue.destination as? ColorManipulatingViewController else {
                fatalError()
            }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                fatalError()
            }
          colorChangeVC.color = crayonList[selectedIndexPath.row]
        }
        
    }
}
