//
//  PluginTableViewController.swift
//  PluginTableViewController
//
//  Created by Vadym Bulavin on 11/9/18.
//  Copyright © 2018 Vadym Bulavin. All rights reserved.
//

import UIKit

class PluginTableViewController<DataSource: DataSourceType, Configurator: ConfiguratorType>: UITableViewController where DataSource.Item == Configurator.Item {
    
    let dataSource: DataSource
    let configurator: Configurator
    
    init(dataSource: DataSource, configurator: Configurator) {
        self.configurator = configurator
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
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
        let cell = configurator.cell(for: item, tableView: tableView, indexPath: indexPath)
        return configurator.configure(cell: cell, item: item, tableView: tableView, indexPath: indexPath)
    }
}
