//
//  PluginTableViewController.swift
//  PluginTableViewController
//
//  Created by Vadym Bulavin on 11/9/18.
//  Copyright © 2018 Vadym Bulavin. All rights reserved.
//

import UIKit

class PluginTableViewController<Configurator: ConfiguratorType>: UITableViewController {
    
    let dataSource: DataSource<Configurator.Item>
    let configurator: Configurator
    
    init(dataSource: DataSource<Configurator.Item>, configurator: Configurator) {
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
