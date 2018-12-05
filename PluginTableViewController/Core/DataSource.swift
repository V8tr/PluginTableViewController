//
//  DataSource.swift
//  PluginTableViewController
//
//  Created by Vadym Bulavin on 11/9/18.
//  Copyright © 2018 Vadym Bulavin. All rights reserved.
//

import Foundation

struct DataSource<Item> {
    var sections: [Section<Item>]
    
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
}
