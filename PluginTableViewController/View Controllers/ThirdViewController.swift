//
//  ThirdViewController.swift
//  PluginTableViewController
//
//  Created by Vadym Bulavin on 11/9/18.
//  Copyright © 2018 Vadym Bulavin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setupTable() {
        let section0 = Section<Cell>(items: [.cell("A"), .cell("B"), .cell("C")])
        let section1 = Section<Cell>(items: [.anotherCell("1"), .anotherCell("2"), .anotherCell("3")])
        let dataSource = DataSource(sections: [section0, section1])
        
        let configurator1 = Configurator { (cell, model: Cell.Model, tableView, indexPath) -> TableCell in
            cell.textLabel?.text = model
            return cell
        }
        
        let configurator2 = Configurator { (cell, model: Cell.AnotherModel, tableView, indexPath) -> NibCell in
            cell.textLabel?.text = model
            return cell
        }
        
        let aggregate = AggregateConfigurator(cellConfigurator: configurator1, anotherCellConfigurator: configurator2)
        
        let table = PluginTableViewController(dataSource: dataSource, configurator: aggregate)
        
        add(child: table, container: view)
    }
}

private enum Cell {
    typealias Model = String
    typealias AnotherModel = String
    
    case cell(Model)
    case anotherCell(AnotherModel)
}

private struct AggregateConfigurator: ConfiguratorType {
    let cellConfigurator: Configurator<Cell.Model, TableCell>
    let anotherCellConfigurator: Configurator<Cell.AnotherModel, NibCell>
    
    func reuseIdentifier(for item: Cell, indexPath: IndexPath) -> String {
        switch item {
        case .cell:
            return cellConfigurator.reuseIdentifier
        case .anotherCell:
            return anotherCellConfigurator.reuseIdentifier
        }
    }

    func configuredCell(for item: Cell, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch item {
        case .cell(let model):
            return cellConfigurator.configuredCell(for: model, tableView: tableView, indexPath: indexPath)
        case .anotherCell(let model):
            return anotherCellConfigurator.configuredCell(for: model, tableView: tableView, indexPath: indexPath)
        }
    }
    
    func registerCells(in tableView: UITableView) {
        cellConfigurator.registerCells(in: tableView)
        anotherCellConfigurator.registerCells(in: tableView)
    }
}
