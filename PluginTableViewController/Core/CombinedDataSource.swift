//
//  CombinedDataSource.swift
//  PluginTableViewController
//
//  Created by Vadym Bulavin on 12/5/18.
//  Copyright © 2018 Vadym Bulavin. All rights reserved.
//

import UIKit

struct CombinedDataSource<Item, Configurator: ConfiguratorType> where Item == Configurator.Item {
    var sections: [Section<Item>]
    let configurator: Configurator
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard section < sections.count else { return 0 }
        return sections[section].items.count
    }
    
    func item(at indexPath: IndexPath) -> Item {
        return sections[indexPath.section].items[indexPath.row]
    }
    
    func reuseIdentifer(for item: Item, indexPath: IndexPath) -> String {
        return configurator.reuseIdentifer(for: item, indexPath: indexPath)
    }
    
    func configuredCell(for item: Item, tableView: UITableView, indexPath: IndexPath) -> Configurator.Cell {
        return configurator.configuredCell(for: item, tableView: tableView, indexPath: indexPath)
    }
    
    func registerCells(in tableView: UITableView) {
        configurator.registerCells(in: tableView)
    }
}
