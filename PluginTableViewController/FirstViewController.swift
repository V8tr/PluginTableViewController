//
//  FirstViewController.swift
//  PluginTableViewController
//
//  Created by Vadym Bulavin on 11/9/18.
//  Copyright © 2018 Vadym Bulavin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setupTable() {
        let section0 = Section(items: ["A", "B", "C"])
        let section1 = Section(items: ["1", "2", "3"])
        let dataSource = DataSource(sections: [section0, section1])

        let configurator = Configurator { (cell, model: String, tableView, indexPath) -> TableCell in
            cell.textLabel?.text = model
            return cell
        }
        
        let table = PluginTableViewController(dataSource: dataSource, configurator: configurator)
        
        add(child: table, container: view)
    }

}
