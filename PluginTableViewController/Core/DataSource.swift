//
//  DataSource.swift
//  PluginTableViewController
//
//  Created by Vadym Bulavin on 11/9/18.
//  Copyright © 2018 Vadym Bulavin. All rights reserved.
//

import Foundation

protocol DataSourceType {
    associatedtype Item
    
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(row: Int, section: Int) -> Item
}

extension DataSourceType {
    func item(at indexPath: IndexPath) -> Item {
        return item(row: indexPath.row, section: indexPath.section)
    }
}

struct DataSource<Item>: DataSourceType {
    var sections: [Section<Item>]
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard section < sections.count else { return 0 }
        return sections[section].items.count
    }
    
    func item(row: Int, section: Int) -> Item {
        return sections[section].items[row]
    }
}
