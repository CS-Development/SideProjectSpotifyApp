//
//  GenericTableViewController.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 21.09.21.
//

import Foundation
import UIKit

struct Model1 {
    let name: String
}

struct Model2 {
    let message: String
    let date: Date
}

class MyTableViewCell: UITableViewCell {
    
    let label = UILabel()
}


class MyViewController<Cell: UITableViewCell, T>: UIViewController, UITableViewDataSource {
    
    var items: [T]
    var configure: (Cell,T)->Void
    
    init(items: [T], configure: @escaping (Cell,T)->Void) {
        self.items = items
        self.configure = configure
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Cell
        configure(cell, model)
        return cell
    }
    
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        tableView.dataSource = self
    }
}

class CompositionRoot {
    
    
    func makeModel1TableViewVC() -> UIViewController {
        let items = [Model1]()
        let vc = MyViewController<MyTableViewCell, Model1>(items: items) { cell, model in
            cell.label.text = model.name
        }
        return vc
    }
    
    func makeModel2TableViewVC() -> UIViewController {
        let items = [Model2]()
        let vc = MyViewController<MyTableViewCell, Model2>(items: items) { cell, model in
            cell.label.text = "message: \(model.message), on \(model.date)"
        }
        return vc
    }
}


