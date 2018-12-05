//
//  PluginTableViewController.swift
//  PluginTableViewController
//
//  Created by Vadym Bulavin on 11/9/18.
//  Copyright © 2018 Vadym Bulavin. All rights reserved.
//

import UIKit

class PluginTableViewController<Item, Cell: UITableViewCell>: UITableViewController {
    
    let dataSource: DataSource<Item>
    let configurator: Configurator<Item, Cell>
    
    init(dataSource: DataSource<Item>, configurator: Configurator<Item, Cell>) {
        self.dataSource = dataSource
        self.configurator = configurator
        super.init(nibName: nil, bundle: nil)
        configurator.registerCells(in: tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfItems(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource.item(at: indexPath)
        return configurator.configuredCell(for: item, tableView: tableView, indexPath: indexPath)
    }
}
